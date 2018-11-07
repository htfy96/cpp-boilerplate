#include "example.hpp"
#include <memory>
#include <spdlog/spdlog.h>
#include <spdlog/sinks/stdout_color_sinks.h>

namespace example
{
    int times(int a, int b)
    {
        static auto logger = spdlog::stdout_color_mt("times_logger");
        logger->debug("times called with ({}, {})", a, b);
        int result = a * b;
        logger->debug("Result is {}", result);
        return result;
    }
}
