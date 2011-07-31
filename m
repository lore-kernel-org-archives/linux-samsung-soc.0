From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/3] arm: dt: Add device tree support for i2c instance
 0 and 1 on exynos4 dt machine
Date: Sun, 31 Jul 2011 22:02:09 +0100
Message-ID: <CAJuYYwQ_zvgC0DqSbFHd-84s7DBjv8OqyovvjZr9M74K02K3VQ@mail.gmail.com>
References: <1311329918-8105-1-git-send-email-thomas.abraham@linaro.org>
	<1311329918-8105-2-git-send-email-thomas.abraham@linaro.org>
	<1311329918-8105-3-git-send-email-thomas.abraham@linaro.org>
	<1311329918-8105-4-git-send-email-thomas.abraham@linaro.org>
	<20110731035536.GI24334@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110731035536.GI24334-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Grant,

On 31 July 2011 04:55, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> On Fri, Jul 22, 2011 at 03:48:38PM +0530, Thomas Abraham wrote:
>> Add device node for i2c instance 0 and 1 and list all its connected =
slave
>> devices.
>>
>> Signed-off-by: Thomas Abraham <thomas.abraham at linaro.org>
>> ---
>> =A0arch/arm/boot/dts/exynos4-smdkv310.dts =A0| =A0 45 ++++++++++++++=
+++++++++++++++++
>> =A0arch/arm/mach-exynos4/Kconfig =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +
>> =A0arch/arm/mach-exynos4/mach-exynos4-dt.c | =A0 23 ++++++++++++++++
>> =A03 files changed, 70 insertions(+), 0 deletions(-)
>>

[...]

>> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/K=
config
>> index bb97b7e..06b43ca 100644
>> --- a/arch/arm/mach-exynos4/Kconfig
>> +++ b/arch/arm/mach-exynos4/Kconfig
>> @@ -193,6 +193,8 @@ config MACH_EXYNOS4_DT
>> =A0 =A0 =A0 select S3C_DEV_HSMMC
>> =A0 =A0 =A0 select S3C_DEV_HSMMC2
>> =A0 =A0 =A0 select EXYNOS4_SETUP_SDHCI
>> + =A0 =A0 select EXYNOS4_SETUP_I2C0
>> + =A0 =A0 select EXYNOS4_SETUP_I2C1
>
> Hmmm, there should be a better way do do this; but I don't have any
> objections.

These config options could go away when the pinmux subsystem patches
are accepted and the i2c driver is modified to use it. Till then, we
need to include these config options.

>
> Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>

Thanks Grant.

Regards,
Thomas.

[...]
