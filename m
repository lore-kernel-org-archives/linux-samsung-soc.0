From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH 1/2] ARM: exynos_defconfig: Enable rtl8152 ethernet driver
 for Odroid-XU4
Date: Mon, 5 Oct 2015 12:34:52 +0530
Message-ID: <CANAwSgSCfy_X+HD2NdoeGxSV5srv_a+vzw8Gs94PgVkwn2ZjwA@mail.gmail.com>
References: <1444026570-14076-1-git-send-email-linux.amoon@gmail.com> <56121AF4.6020202@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56121AF4.6020202@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, Thierry Reding <treding@nvidia.com>, Andreas Faerber <afaerber@suse.de>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Geert Uytterhoeven <geert+renesas@glider.be>, Lee Jones <lee.jones@linaro.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Ray Jui <rjui@broadcom.com>, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

hi Krzysztof,

On 5 October 2015 at 12:08, Krzysztof Kozlowski <k.kozlowski@samsung.com> wrote:
> On 05.10.2015 15:29, Anand Moon wrote:
>> Enable CONFIG_USB_RTL8152 for Odroid-XU4.
>
> Why?
>
> Best regards,
> Krzysztof
>
>>
>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>> ---
>>  arch/arm/configs/exynos_defconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
>> index 1ff2bfa..5d1937b 100644
>> --- a/arch/arm/configs/exynos_defconfig
>> +++ b/arch/arm/configs/exynos_defconfig
>> @@ -61,6 +61,7 @@ CONFIG_BLK_DEV_DM=y
>>  CONFIG_DM_CRYPT=m
>>  CONFIG_NETDEVICES=y
>>  CONFIG_SMSC911X=y
>> +CONFIG_USB_RTL8152=y
>>  CONFIG_USB_USBNET=y
>>  CONFIG_USB_NET_SMSC75XX=y
>>  CONFIG_USB_NET_SMSC95XX=y
>>
>

Odroid XU4 supports RTL8152/RTL8153 Based USB 3.0 Ethernet Adapters.

Will send v2 version of the patch.

-Anand Moon
