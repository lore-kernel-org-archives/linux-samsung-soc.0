From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [GIT PULL 4/9] ARM64: EXYNOS: Soc specific code for v4.5
Date: Wed, 23 Dec 2015 19:48:08 +0900
Message-ID: <567A7BE8.8000303@samsung.com>
References: <1449020386-20250-1-git-send-email-k.kozlowski@samsung.com>
 <1449020386-20250-5-git-send-email-k.kozlowski@samsung.com>
 <20151222044926.GE30172@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151222044926.GE30172@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: k.kozlowski.k@gmail.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Kevin Hilman <khilman@linaro.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

W dniu 22.12.2015 o 13:49, Olof Johansson pisze:
> On Wed, Dec 02, 2015 at 10:39:41AM +0900, Krzysztof Kozlowski wrote:
>> Hi Kukjin,
>>
>> ARM64 change touch also defconfig.
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
>>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc64-4.5
>>
>> for you to fetch changes up to db44c07a3f0b32815bd1f3e731db9e043e57cf9c:
>>
>>   arm64: EXYNOS: Consolidate ARCH_EXYNOS7 symbol into ARCH_EXYNOS (2015-11-22 19:31:30 +0900)
> 
> Given that Arnd started splitting out config64 separately, there's a small
> chance we'll get a conflict here. We can deal with that if needed though.
> 
> Still, since this branch contains the previous clock branch I can't apply it
> as it is. Can you respin without that for now?

This depends on the clock change because:
1. Clock change removes last usage of ARCH_EXYNOS7,
2. This patch removes the ARCH_EXYNOS7 itself.

So if #1 has to wait, then skip this as well.

Best regards,
Krzysztof
