From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 3/4] arm64: dts: exynos: DT for v4.11
Date: Mon, 16 Jan 2017 22:40:57 -0800
Message-ID: <20170117064057.GN16607@localhost>
References: <20170113152030.13586-1-krzk@kernel.org>
 <20170113152030.13586-3-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170113152030.13586-3-krzk@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jan 13, 2017 at 05:20:29PM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> Important:
> 1. Unlike others, this is rebased on v4.10-rc2 because v4.10-rc1 was not
>    building on arm64.
> 2. This contains pinctrl change (in header), acked by Linus Walleij.
>    Although I kept it on separate branch and merged here, but I did not
>    prepare a separate pull request for this one pinctrl change - it is
>    just one patch. Anyway it sits on separate branch so this is still
>    possible if you need it.
> 
> Best regards,
> Krzysztof
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> 
> The following changes since commit 0c744ea4f77d72b3dcebb7a8f2684633ec79be88:
> 
>   Linux 4.10-rc2 (2017-01-01 14:31:53 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-4.11
> 
> for you to fetch changes up to e4e381133241a27d732e78be09973b89a193eaf7:
> 
>   arm64: dts: exynos: Enable HDMI/TV path on Exynos5433-TM2 (2017-01-11 18:20:28 +0200)
> 
> ----------------------------------------------------------------
> Samsung DeviceTree ARM64 update for v4.11:
> 1. Add bus frequency and voltage scalling on Exynos5433 TM2 device (along with
>    necessary bus nodes and Platform Performance Monitoring Unit on Exynos5433).
> 2. Use macros for pinctrl settings on Exynos5433.
>    This contains necessary header with bindings.
> 3. Minor cleanups in Exynos5433 DTSI and boards using it.
> 4. Create common DTSI betweem Exynos5433 TM2E and TM2E.
> 5. Add HDMI/TV to Exynos5433 TM2.

Merged, thanks.


-Olof
