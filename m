From: Tarek Dakhran <t.dakhran@samsung.com>
Subject: Re: [PATCH v11 0/3] Exynos 5410 support
Date: Thu, 29 May 2014 18:46:58 +0400
Message-ID: <53874862.5080809@samsung.com>
References: <1401074613-29227-1-git-send-email-t.dakhran@samsung.com>
 <7hr43f9mmn.fsf@paris.lan> <538737CA.4070709@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <538737CA.4070709@suse.de>
Sender: linux-doc-owner@vger.kernel.org
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>, Kevin Hilman <khilman@linaro.org>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Tomasz Figa <t.figa@samsung.com>, Mike Turquette <mturquette@linaro.org>, Vyacheslav Tyrtov <v.tyrtov@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Romain Naour <romain.naour@openwide.fr>, Chander Kashyap <chander.kashyap@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Tarek Dakhran <t.dakhran@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Andreas,

On 05/29/2014 05:36 PM, Andreas F=E4rber wrote:
> Hi Tarek and Kevin,
>
> Am 27.05.2014 19:06, schrieb Kevin Hilman:
>> Tarek Dakhran <t.dakhran@samsung.com> writes:
>>
>>> The series of patches represent support of Exynos 5410 SoC
>>>
>>> The Exynos 5410 is the first Samsung SoC based on big.LITTLE archit=
ecture
>>>
>>> Patches add new platform description, support of clock controller a=
nd device
>>> tree for Exynos 5410.
>>>
>>> Has been build on Samsung Linux Kernel
>>>    (branch: for-next, commit: 97eae6c Merge branch 'v3.16-next/mult=
iplatform' into for-next)
>>>
>>> Has been tested on: 1) Exynos 5410 reference board (exynos_defconfi=
g)
>>> 		    2) Exynos 5410 reference board (multi_v7_defconfig)
>>> 		    3) Odroid-XU board (exynos_defconfig)
>>> 		    4) Odroid-XU board (multi_v7_defconfig)
>> Tested-by: Kevin Hilman <khilman@linaro.org>
>>
>> FYI, I boot tested this on an odroid-xu (exynos_defconfig and
>> multi_v7_defconfig.)
> Could you clarify: Are you using exynos5410-smdk5410.dts with the
> ODROID-XU or do you have some upcoming exynos5410-odroidxu.dts based =
on
> exynos5410.dtsi?
We use exynos5410-smdk5410.dts for booting ODROID-XU.

>
> Thanks,
> Andreas
>


--=20
Best regards,
     Tarek Dakhran

