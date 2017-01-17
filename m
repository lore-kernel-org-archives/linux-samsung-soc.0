From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] ARM: exynos: Fixes for v4.10
Date: Mon, 16 Jan 2017 21:46:56 -0800
Message-ID: <20170117054656.GC16607@localhost>
References: <20170113143225.11311-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170113143225.11311-1-krzk@kernel.org>
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
Cc: linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jan 13, 2017 at 04:32:25PM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> Just a couple of minor fixes for this release cycle.
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
>   git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-fixes-4.10
> 
> for you to fetch changes up to 3ef01c968fbfb21c2f16281445d30a865ee4412c:
> 
>   ARM: s3c2410_defconfig: Fix invalid values for NF_CT_PROTO_* (2017-01-02 21:05:34 +0200)
> 
> ----------------------------------------------------------------
> Samsung fixes for v4.10:
> 1. Update maintainers entry with Patchwork address.
> 2. Fix invalid values for NF_CT_PROTO_* in s3c2410 defconfig (these options
>    cannot be modules anymore).
> 
> ----------------------------------------------------------------
> Krzysztof Kozlowski (2):
>       MAINTAINERS: Add Patchwork URL to Samsung Exynos entry
>       ARM: s3c2410_defconfig: Fix invalid values for NF_CT_PROTO_*

Merged, thanks.


-Olof
