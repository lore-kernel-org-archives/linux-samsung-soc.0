From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 01/27] ARM: EXYNOS: Add Exynos3250 SoC ID
Date: Fri, 11 Apr 2014 10:12:30 +0200
Message-ID: <4735652.2Yh9suVdiT@wuerfel>
References: <1397122658-16013-1-git-send-email-cw00.choi@samsung.com>
 <53478C75.60302@samsung.com> <53479545.4050707@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <53479545.4050707@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, hyunhee.kim@samsung.com, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, yj44.cho@samsung.com, inki.dae@samsung.com, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, kgene.kim@samsung.com, Olof Johansson <olof@lixom.net>
List-Id: linux-samsung-soc@vger.kernel.org

On Friday 11 April 2014 16:09:57 Chanwoo Choi wrote:
> On 04/11/2014 03:32 PM, Chanwoo Choi wrote:
> >>>  
> >>> +#if defined(CONFIG_SOC_EXYNOS3250)
> >>> +# define soc_is_exynos3250()    is_samsung_exynos3250()
> >>> +#else
> >>> +# define soc_is_exynos3250()    0
> >>> +#endif
> >>
> >> In general, I think we have too much code littered with soc_is_<foo>() going
> >> on, so please try to avoid adding more for this SoC. Especially in cases where
> >> you just want to bail out of certain features where we might already have
> >> function pointers to control if a function is called or not, such as the
> >> firmware interfaces.
> >>
> > 
> > Do you prefer dt helper function such as following function instead of new soc_is_xx() ?
> > - of_machine_is_compatible("samsung,exynos3250")
> > 
> 
> I think of_machine_is_compatible() is not proper alternative method.
> of_machine_is_compatible can be only used if CONFIG_OF is enabled.
> 

CONFIG_OF is enabled by definition, that wouldn't be a problem. However,
of_machine_is_compatible() doesn't solve the problem that Olof mentioned,
you still make runtime-decisions based on the SoC ID, which you should not.

Instead, the code should be restructured so it doesn't have to know which
SoC is being used. If some machines work differently from others, that should
be local knowledge within the device driver, and it can use for instance
a DT property of the device node that describes the register set the driver
is using.

	Arnd
