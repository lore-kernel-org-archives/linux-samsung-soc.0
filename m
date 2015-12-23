From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [GIT PULL 6/9] ARM: EXYNOS: clk: Another clock dependency, ARMv7,
 for v4.5
Date: Wed, 23 Dec 2015 19:55:11 +0900
Message-ID: <567A7D8F.3010209@samsung.com>
References: <1449020386-20250-1-git-send-email-k.kozlowski@samsung.com>
 <1449020386-20250-7-git-send-email-k.kozlowski@samsung.com>
 <20151222045135.GG30172@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151222045135.GG30172@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: k.kozlowski.k@gmail.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Kevin Hilman <khilman@linaro.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@codeaurora.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

W dniu 22.12.2015 o 13:51, Olof Johansson pisze:
> On Wed, Dec 02, 2015 at 10:39:43AM +0900, Krzysztof Kozlowski wrote:
>> Hi Kukjin,
>>
>> This is also clock dependency. I put it in separate tag in case clock
>> folks want to pull it also.
>>
>> Best regards,
>> Krzysztof
>>
>>
>> The following changes since commit 8005c49d9aea74d382f474ce11afbbc7d7130bec:
>>
>>   Linux 4.4-rc1 (2015-11-15 17:00:27 -0800)
>>
>> are available in the git repository at:
>>
>>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-exynos4-4.5
>>
>> for you to fetch changes up to 94af7a3c310f5877dc6f756179b92f24f89a9b08:
>>
>>   clk: samsung: exynos4: Add SSS gate clock (2015-11-18 22:02:02 +0900)
> 
> Again, this should probably go through the clk maintainer (or have an ack).
> It's just two one-line changes though, so if they're slow to respond we can
> take it as a fallback. Resend if that's the case.
> 

Wait, I am missing something. This contains only one patch which has the
Stephen's Boyd ack:
http://lists.infradead.org/pipermail/linux-arm-kernel/2015-October/379230.html
(this is in commit message already)

What kind of ack do you expect here? Ack for pull-request?

Best regards,
Krzysztof
