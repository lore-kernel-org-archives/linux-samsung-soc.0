From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 2/2] ARM: Exynos: Hook up power domains to generic power
 domain infrastructure
Date: Mon, 2 Jan 2012 07:44:09 +0530
Message-ID: <CAJuYYwQbTJTRdsa9WpQuCtSTYacbrcP3CVBFaAYHP1jLPky10A@mail.gmail.com>
References: <1323704789-23923-1-git-send-email-thomas.abraham@linaro.org>
	<1323704789-23923-2-git-send-email-thomas.abraham@linaro.org>
	<1323704789-23923-3-git-send-email-thomas.abraham@linaro.org>
	<4EFB66C3.4040504@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:34572 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751054Ab2ABCOL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 1 Jan 2012 21:14:11 -0500
In-Reply-To: <4EFB66C3.4040504@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <snjw23@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, rjw@sisk.pl, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, patches@linaro.org

Hi Sylwester,

On 29 December 2011 00:28, Sylwester Nawrocki <snjw23@gmail.com> wrote:
> Hi Thomas,
>
> On 12/12/2011 04:46 PM, Thomas Abraham wrote:
>> The generic power domain infrastructure is used to control the power=
 domains
>> available on Exynos4. For non-dt platforms, the power domains are st=
atically
>> instantiated. For dt platforms, the power domain nodes found in the =
device
>> tree are instantiated.
>>
>> Cc: Kukjin Kim <kgene.kim@samsung.com>
>> Cc: Rob Herring <rob.herring@calxeda.com>
>> Cc: Grant Likely <grant.likely@secretlab.ca>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>> This patch is mainly derived from Mark Brown's work on generic power=
 domain
>> support for s3c64xx platforms. The existing exynos4 power domain imp=
lementation
>> is not removed in this patch. The devices are not yet registered wit=
h the power
>> domains for non-dt platforms.
>>
>> =A0arch/arm/mach-exynos/Kconfig | =A0 =A01 +
>> =A0arch/arm/mach-exynos/pm.c =A0 =A0| =A0179 +++++++++++++++++++++++=
+++++++++++++++++++
>> =A02 files changed, 180 insertions(+), 0 deletions(-)

[...]

> Sorry, I haven't reviewed your patch carefully enough. So for dt plat=
forms
> pd->base is initialized from "reg" property, directly from each power=
 domain's
> DT node. Only the static power domain instantiation for non-dt platfo=
rms would
> possibly need some code modifications when new SoCs are added.
>
> Would be nice to have a relevant patch for *.dts files in this series=
 too. :)

The following is a snippet from the dts file used for testing.

   [...]

   lcd0:power-domain-lcd0 {
            compatible =3D "samsung,exynos4210-pd";
            reg =3D <0x10023C00 0x10>;
   };

   [...]

   fimd0:display-controller {
            compatible =3D "samsung,exynos4-fimd";
            [...]
            pd =3D <&lcd0>;
   };

The fimd (display controller) driver would then do the following.

parp =3D of_get_property(pdev->dev.of_node, "pd", NULL);
pd_np =3D of_find_node_by_phandle(be32_to_cpup(parp));
pm_genpd_of_add_device(pd_np, &pdev->dev);

The lookup is based on the node pointer of the power domain.

Thanks,
Thomas.
