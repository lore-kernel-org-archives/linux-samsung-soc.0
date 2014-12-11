From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH v4 1/2] soc: samsung: add exynos chipid driver support
Date: Thu, 11 Dec 2014 08:30:18 +0530
Message-ID: <548908C2.1060906@samsung.com>
References: <1417594658-2931-1-git-send-email-pankaj.dubey@samsung.com>
 <1417594658-2931-2-git-send-email-pankaj.dubey@samsung.com>
 <CAKew6eVTpu0qWQqd_sxqmRJF6qNMxJp5Mn0_ta5vO+pHAv66ug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAKew6eVTpu0qWQqd_sxqmRJF6qNMxJp5Mn0_ta5vO+pHAv66ug@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Rob Herring <robh+dt@kernel.org>, thomas.ab@samsung.com, Grant Likely <grant.likely@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Yadwinder,

On Thursday 04 December 2014 11:56 PM, Yadwinder Singh Brar wrote:
> Hi Pankaj,
>
>
> On Wed, Dec 3, 2014 at 1:47 PM, Pankaj Dubey <pankaj.dubey@samsung.com
> <mailto:pankaj.dubey@samsung.com>> wrote:
>
>     Exynos SoCs have Chipid, for identification of product IDs
>     and SoC revisions. This patch intendes to provide initialization
>     code for all these functionalites, at the same time it provides some
>     sysfs entries for accessing these information to userspace.
>
>     This driver usese existing binding for exnos-chipid.
>
> [ ... ]
>
>     +
>     +static unsigned int soc_product_id;
>     +static unsigned int soc_revision;
>     +
>     +int exynos_product_id(void)
>     +{
>     +       return soc_product_id;
>     +}
>     +EXPORT_SYMBOL(exynos_product_id);
>     +
>     +int exynos_revision(void)
>     +{
>     +       return soc_revision;
>     +}
>     +EXPORT_SYMBOL(exynos_revision);
>     +
>
>
> How about exporting only a struct containing members : soc_revision,
> soc_product_id

OK, keeping in mind that chipid driver might be used from other drivers 
as well (such as asv) other than from mach-exynos, we can do this.

> and may be some more like asv/fused_info  and keeping these function as

Other members such as fused_info etc. can be added as and when required. 
As of now there is no active user of all those.

> inlines ?
>
>     +static const char *exynos_product_id_to_name(unsigned int product_id)
>
>
> __init ?   hmm .. I think almost whole driver other than __ATTR funcs.
>

OK, I'll take care of this in next patch version.

> Otherwise it looks nice to me :)
>
> Best Regards,
> Yadwinder


Thanks for review.

Pankaj Dubey
