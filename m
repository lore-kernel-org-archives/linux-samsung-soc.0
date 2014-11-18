From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: fix infinite loop issue incurred by no pair
Date: Tue, 18 Nov 2014 17:20:57 +0900
Message-ID: <546B0169.4010602@samsung.com>
References: <1416280832-24609-1-git-send-email-inki.dae@samsung.com>
 <1416297489.2480.5.camel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:29975 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752783AbaKRIVU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Nov 2014 03:21:20 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NF8003JR76X4S80@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Nov 2014 17:20:57 +0900 (KST)
In-reply-to: <1416297489.2480.5.camel@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Cc: dri-devel@lists.freedesktop.org, airlied@linux.ie, linux-samsung-soc@vger.kernel.org, khilman@deeprootsystems.com

On 2014=EB=85=84 11=EC=9B=94 18=EC=9D=BC 16:58, Sjoerd Simons wrote:
> On Tue, 2014-11-18 at 12:20 +0900, Inki Dae wrote:
>> This patch makes the deferred probe is tried up to 3 times in maximu=
m.
>> However, this is considered only for Exynos drm so I think other SoC
>> drivers could also produce same issue. Therefore, the best way to re=
solve
>> this issue, infinite loop incurred by defered probe, would be that d=
d core
>> is fixed up corrrectly.
>=20
> At first sight this seems to make little to no sense. Unless i'm
> mistaken this would cause the exynos drm probe return -ENODEV to the =
dd
> core, causing it to stop trying to probe. Which obviously breaks your
> infinite loop, it also breaks situations where the probe needs to be
> retried more then 3 times.=20

Right, but at least, we could avoid kernel booting failure which is ver=
y
critical. Please know that this patch is temporary to avoid the kernel
booting failure although deferred probe request of Exynos drm could be
broken. For this, I will look into dd core to find out more generic way=
:
I suspect that this might be incurred in case that a driver is probed i=
n
probe context of other driver or it might be really dd core bug.

Thanks,
Inki Dae

>=20
> I suspect with this patch once exynos DRM is loaded and actually vali=
dly
> needs to defer (iotw when the required modules do exist but simply
> aren't loaded just yet), it still jumps into an infinite loop which y=
ou
> break after 3 tries after which the display will simply never come up
> even if everything is in place because the core doesn't know it shoul=
d
> re-probe....
>=20
>=20
>=20
>> Signed-off-by: Inki Dae <inki.dae@samsung.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_drv.c |    8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/d=
rm/exynos/exynos_drm_drv.c
>> index eab12f0..4d84f3a 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
>> @@ -38,6 +38,8 @@
>>  #define DRIVER_MAJOR	1
>>  #define DRIVER_MINOR	0
>> =20
>> +#define MAX_TRY_PROBE_DEFER	3
>> +
>>  static struct platform_device *exynos_drm_pdev;
>> =20
>>  static DEFINE_MUTEX(drm_component_lock);
>> @@ -481,6 +483,7 @@ static struct component_match *exynos_drm_match_=
add(struct device *dev)
>>  	struct component_match *match =3D NULL;
>>  	struct component_dev *cdev;
>>  	unsigned int attach_cnt =3D 0;
>> +	static unsigned int try_probe_defer;
>> =20
>>  	mutex_lock(&drm_component_lock);
>> =20
>> @@ -527,6 +530,11 @@ out_lock:
>> =20
>>  	mutex_unlock(&drm_component_lock);
>> =20
>> +	if (++try_probe_defer > MAX_TRY_PROBE_DEFER) {
>> +		try_probe_defer =3D 0;
>> +		return ERR_PTR(-ENODEV);
>> +	}
>> +
>>  	return attach_cnt ? match : ERR_PTR(-EPROBE_DEFER);
>>  }
>> =20
>=20
>=20
