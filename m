From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v4 1/3] ARM: dts: Add Peach Pit dts entry for Atmel touchpad
Date: Sun, 14 Sep 2014 01:36:34 +0900
Message-ID: <54147292.2000901@samsung.com>
References: <1410348691-18317-1-git-send-email-javier.martinez@collabora.co.uk> <1410348691-18317-2-git-send-email-javier.martinez@collabora.co.uk> <20140910222553.GF38736@core.coreip.homeip.net> <54116F07.9090007@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:33823 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752104AbaIMQgx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 13 Sep 2014 12:36:53 -0400
In-Reply-To: <54116F07.9090007@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Nick Dyer <nick.dyer@itdev.co.uk>, linux-kernel@vger.kernel.org, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>, Yufeng Shen <miletus@chromium.org>, afaerber@suse.de, linux-arm-kernel@lists.infradead.org

On 09/11/14 18:44, Javier Martinez Canillas wrote:
> Hello Dmitry,
>
Hi,

> On 09/11/2014 12:25 AM, Dmitry Torokhov wrote:
>>>
>>> +&hsi2c_8 {
>>> +	status = "okay";
>>> +	clock-frequency =<333000>;
>>> +
>>> +	/* Atmel mXT336S */
>>> +	trackpad@4b {
>>> +		compatible = "atmel,maxtouch";
>>> +		reg =<0x4b>;
>>> +		interrupt-parent =<&gpx1>;
>>> +		interrupts =<1 IRQ_TYPE_EDGE_FALLING>;
>>> +		wakeup-source;
>>> +		pinctrl-names = "default";
>>> +		pinctrl-0 =<&trackpad_irq>;
>>> +		linux,gpio-keymap =<KEY_RESERVED
>>> +				     KEY_RESERVED
>>> +				     KEY_RESERVED	/* GPIO0 */
>>> +				     KEY_RESERVED	/* GPIO1 */
>>> +				     KEY_RESERVED	/* GPIO2 */
>>> +				     BTN_LEFT>; 	/* GPIO3 */
>>
>> Seems like a single space sneaked between the semicolon and the tab.
>> Maybe whoever applies could squash it.
>>
>
> Right, I set c-default-style to "linux" on Emacs but seems it gets confused
> sometimes when editing Device Tree source files. Sorry about that.
>
Applied this whole series with fixing a white space Dmitry commented.

Note, I will handle all of exynos_defconfig changes separately.

Thanks,
Kukjin
