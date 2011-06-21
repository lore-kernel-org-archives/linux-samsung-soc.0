From: Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC][PATCH 2/5] ARM: SAMSUNG: Changing the build condition of
 OTG platform device for samsung.
Date: Tue, 21 Jun 2011 16:00:38 +0400
Message-ID: <4E0087E6.6020405@ru.mvista.com>
References: <1308639827-2121-1-git-send-email-p.paneri@samsung.com> <1308639827-2121-3-git-send-email-p.paneri@samsung.com> <4E0084B8.1040201@ru.mvista.com> <20110621114940.GB2531@legolas.emea.dhcp.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110621114940.GB2531-UiBtZHVXSwEVvW8u9ZQWYwjfymiNCTlR@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tmarri-qTEPVZfXA3Y@public.gmane.org, naushad-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello.

On 21-06-2011 15:49, Felipe Balbi wrote:

>>> From: Praveen Paneri<p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

>>> Adding dwc driver name in existing platform device
>>> to probe DWC OTG driver.
>>> Introduced otg_set_platdata function to pass platform data
>>> Added selectable config option to add DWC OTG driver for different
>>> machines.

>>> Signed-off-by: Praveen Paneri<p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> [...]

>>> diff --git a/arch/arm/plat-samsung/dev-usb-hsotg.c b/arch/arm/plat-samsung/dev-usb-hsotg.c
>>> index 33a844a..7e6228b 100644
>>> --- a/arch/arm/plat-samsung/dev-usb-hsotg.c
>>> +++ b/arch/arm/plat-samsung/dev-usb-hsotg.c
>> [...]

>>> @@ -37,7 +39,12 @@ static struct resource s3c_usb_hsotg_resources[] = {
>>>   static u64 s3c_hsotg_dmamask = DMA_BIT_MASK(32);
>>>
>>>   struct platform_device s3c_device_usb_hsotg = {
>>> +#ifdef CONFIG_S3C_DEV_USB_HSOTG
>>>   	.name		= "s3c-hsotg",
>>> +#endif
>>> +#ifdef CONFIG_S3C_DEV_DWC_OTG
>>> +	.name		= "dwc_otg",
>>> +#endif

>>     I'd done it as:

>> +#if defined(CONFIG_S3C_DEV_USB_HSOTG)
>>    	.name		= "s3c-hsotg",
>> +#elif defined(CONFIG_S3C_DEV_DWC_OTG)
>> +	.name		= "dwc_otg",
>> +#endif

> no... don't do that. How many times do I have to repeat ? No ifdefs!! we
> want both drivers to be able to be compiled as modules, so add both
> platform devices.

    Sorry, hadn't seen your mail when replying.

WBR, Sergei
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
