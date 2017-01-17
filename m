From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 2/4] ARM: dts: exynos: DT for v4.11
Date: Mon, 16 Jan 2017 22:30:52 -0800
Message-ID: <20170117063052.GM16607@localhost>
References: <20170113152030.13586-1-krzk@kernel.org>
 <20170113152030.13586-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170113152030.13586-2-krzk@kernel.org>
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
Cc: linux-samsung-soc@vger.kernel.org, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jan 13, 2017 at 05:20:28PM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> Few improvements and Exynos4412 DTSI removal.
> 
> This pulls external dependecy from clock tree (one clock commit).
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 7ce7d89f48834cefece7804d38fc5d85382edf77:
> 
>   Linux 4.10-rc1 (2016-12-25 16:13:08 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-4.11
> 
> for you to fetch changes up to bca9085e0ae93253bc93ce218c85ac7d7e7f1831:
> 
>   ARM: dts: exynos: remove Exynos4212 support (dead code) (2017-01-11 18:28:43 +0200)
> 
> ----------------------------------------------------------------
> Samsung DeviceTree update for v4.11:
> 1. Fixes for initial audio clocks configuration.
> 2. Enable sound on Odroid-X board.
> 3. Enable DMA for UART modules on Exynos5 SoCs.
> 4. Add CPU OPPs for Exynos4412 Prime (newer version of Exynos4412). This pulls
>    necessary change in the clocks.
> 5. Remove Exynos4212. We do not have any mainline boards with it. This will
>    simplify few bits later.

Merged, thanks.


-Olof
