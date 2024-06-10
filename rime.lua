---@diagnostic disable: unused-local, undefined-global, lowercase-global

function datetime_translator(input, seg)
    if input == "jbtm" then
        -- Candidate(type, start, end, text, comment)
        yield(Candidate("time", seg.start, seg._end, os.date("%Y-%m-%d"), ""))
        yield(Candidate("time", seg.start, seg._end, os.date("%Y年%m月%d日"), ""))
        yield(Candidate("time", seg.start, seg._end, os.date("%m-%d"), ""))
        yield(Candidate("time", seg.start, seg._end, os.date("%Y/%m/%d"), ""))
    elseif input == "zotm" then
        -- 昨天日期
        yield(Candidate("time", seg.start, seg._end, os.date("%Y-%m-%d", os.time() - 60 * 60 * 24), "〔昨天〕"))
    elseif input == "mktm" then
        -- 明天日期
        yield(Candidate("time", seg.start, seg._end, os.date("%Y-%m-%d", os.time() - 60 * 60 * 24), "〔明天〕"))
    elseif input == "uijmio" then
        -- 时间戳
        yield(Candidate("time", seg.start, seg._end, os.time(), "〔时间戳〕"))
    elseif input == "date" then
        yield(Candidate("time", seg.start, seg._end, os.date("%Y-%m-%d"), ""))
    elseif input == "time" then
        yield(Candidate("time", seg.start, seg._end, os.date("%H:%M"), ""))
        yield(Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), ""))
    end
end
