From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 4/9] ARM64: EXYNOS: Soc specific code for v4.5
Date: Mon, 21 Dec 2015 20:49:26 -0800
Message-ID: <20151222044926.GE30172@localhost>
References: <1449020386-20250-1-git-send-email-k.kozlowski@samsung.com>
 <1449020386-20250-5-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1449020386-20250-5-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kevin Hilman <khilman@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Dec 02, 2015 at 10:39:41AM +0900, Krzysztof Kozlowski wrote:
> Hi Kukjin,
> 
> ARM64 change touch also defconfig.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 8005c49d9aea74d382f474ce11afbbc7d7130bec:
> 
>   Linux 4.4-rc1 (2015-11-15 17:00:27 -0800)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc64-4.5
> 
> for you to fetch changes up to db44c07a3f0b32815bd1f3e731db9e043e57cf9c:
> 
>   arm64: EXYNOS: Consolidate ARCH_EXYNOS7 symbol into ARCH_EXYNOS (2015-11-22 19:31:30 +0900)

Given that Arnd started splitting out config64 separately, there's a small
chance we'll get a conflict here. We can deal with that if needed though.

Still, since this branch contains the previous clock branch I can't apply it
as it is. Can you respin without that for now?


-Olof
