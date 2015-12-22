From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 6/9] ARM: EXYNOS: clk: Another clock dependency,
 ARMv7, for v4.5
Date: Mon, 21 Dec 2015 20:51:35 -0800
Message-ID: <20151222045135.GG30172@localhost>
References: <1449020386-20250-1-git-send-email-k.kozlowski@samsung.com>
 <1449020386-20250-7-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1449020386-20250-7-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kevin Hilman <khilman@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Dec 02, 2015 at 10:39:43AM +0900, Krzysztof Kozlowski wrote:
> Hi Kukjin,
> 
> This is also clock dependency. I put it in separate tag in case clock
> folks want to pull it also.
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
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-exynos4-4.5
> 
> for you to fetch changes up to 94af7a3c310f5877dc6f756179b92f24f89a9b08:
> 
>   clk: samsung: exynos4: Add SSS gate clock (2015-11-18 22:02:02 +0900)

Again, this should probably go through the clk maintainer (or have an ack).
It's just two one-line changes though, so if they're slow to respond we can
take it as a fallback. Resend if that's the case.


-Olof
