From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 1/9] drm/exynos: use SoC name to identify hdmi version
Date: Mon, 17 Jun 2013 07:36:57 +0530
Message-ID: <CAPdUM4N6nsRMQnML-n8n924yxSO=p4Vqg7WrA8O6YPKM=9N8Hg@mail.gmail.com>
References: <1370959891-8923-1-git-send-email-rahul.sharma@samsung.com>
	<1370959891-8923-2-git-send-email-rahul.sharma@samsung.com>
	<51BABDDC.60603@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f172.google.com ([74.125.82.172]:62330 "EHLO
	mail-we0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753966Ab3FQCG6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Jun 2013 22:06:58 -0400
Received: by mail-we0-f172.google.com with SMTP id q56so1929117wes.31
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Jun 2013 19:06:57 -0700 (PDT)
In-Reply-To: <51BABDDC.60603@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: sw0312.kim@samsung.com
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, joshi@samsung.com

Thanks Seung-Woo,

On Fri, Jun 14, 2013 at 12:23 PM, =B1=E8=BD=C2=BF=EC <sw0312.kim@samsun=
g.com> wrote:
> Hello Rahul,
>
> On 2013=B3=E2 06=BF=F9 11=C0=CF 23:11, Rahul Sharma wrote:
>> Exynos hdmi IP version is named after hdmi specification version i.e=
=2E
>> 1.3 and 1.4. This versioning mechanism is not sufficient to handle
>> the diversity in the hdmi/phy IPs which are present across the exyno=
s
>> SoC family.
>>
>> This patch changes the hdmi version to the name of the SoC in which
>> the IP was introduced for the first time. Same version is applicable
>> to all subsequent SoCs having the same IP version.
>>
>> Exynos4210 has 1.3 HDMI, i2c mapped phy with configuration set.
>> Exynos5250 has 1.4 HDMI, i2c mapped phy with configuration set.
>> Exynos5420 has 1.4 HDMI, Platform Bus mapped phy with configuration =
set.
>>
>> Based on the HDMI IP version we cannot decide to pick Exynos5250 phy=
 conf
>> and use i2c for data transfer or Exynos5420 phy confs and platform b=
us
>> calls for communication.
>
> Considering your other patch to divide hdmi and hdmiphy, how do you
> think using hdmiphy version parsed from hdmiphy dt binding from phy c=
ode
> instead of using hdmi version for both hdmi and hdmiphy? If that, thi=
s
> SoC identifying hdmi version is not necessary because there is no cha=
nge
> at least in hdmi side.
>
> And IMO, it seems easy to merge hdmiphy related patch first before
> merging patch for exynos5420.
>

You are right. If we isolate hdmiphy first from hdmi IP driver, we
dont need this
patch. I will revive the hdmiphy separation patch and get that merge fi=
rst.

regards,
Rahul Sharma.

>>
>> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_hdmi.c |  249 +++++++++++++++++------=
-----------
>>  drivers/gpu/drm/exynos/regs-hdmi.h   |   78 +++++------
>>  2 files changed, 164 insertions(+), 163 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/=
exynos/exynos_hdmi.c
>> index 75a6bf3..9384ffc 100644
>> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
>> @@ -73,9 +73,9 @@ enum HDMI_PACKET_TYPE {
>>       HDMI_PACKET_TYPE_AUI =3D HDMI_PACKET_TYPE_INFOFRAME + 4
>>  };
>>
>> -enum hdmi_type {
>> -     HDMI_TYPE13,
>> -     HDMI_TYPE14,
>> +enum hdmi_version {
>> +     HDMI_VER_EXYNOS4210,
>> +     HDMI_VER_EXYNOS4212,
>>  };
>
> <snip>
>
> --
> Seung-Woo Kim
> Samsung Software R&D Center
> --
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
