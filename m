From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v4 1/3] ARM: dts: Add Peach Pit dts entry for Atmel touchpad
Date: Thu, 11 Sep 2014 11:44:39 +0200
Message-ID: <54116F07.9090007@collabora.co.uk>
References: <1410348691-18317-1-git-send-email-javier.martinez@collabora.co.uk> <1410348691-18317-2-git-send-email-javier.martinez@collabora.co.uk> <20140910222553.GF38736@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:36149 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753994AbaIKJoq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Sep 2014 05:44:46 -0400
In-Reply-To: <20140910222553.GF38736@core.coreip.homeip.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, afaerber@suse.de, Nick Dyer <nick.dyer@itdev.co.uk>, Yufeng Shen <miletus@chromium.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sjoerd Simons <sjoerd.simons@collabora.co.uk>

Hello Dmitry,

On 09/11/2014 12:25 AM, Dmitry Torokhov wrote:
>>  
>> +&hsi2c_8 {
>> +	status = "okay";
>> +	clock-frequency = <333000>;
>> +
>> +	/* Atmel mXT336S */
>> +	trackpad@4b {
>> +		compatible = "atmel,maxtouch";
>> +		reg = <0x4b>;
>> +		interrupt-parent = <&gpx1>;
>> +		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
>> +		wakeup-source;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&trackpad_irq>;
>> +		linux,gpio-keymap = <KEY_RESERVED
>> +				     KEY_RESERVED
>> +				     KEY_RESERVED	/* GPIO0 */
>> +				     KEY_RESERVED	/* GPIO1 */
>> +				     KEY_RESERVED	/* GPIO2 */
>> +				     BTN_LEFT>; 	/* GPIO3 */
> 
> Seems like a single space sneaked between the semicolon and the tab.
> Maybe whoever applies could squash it.
> 

Right, I set c-default-style to "linux" on Emacs but seems it gets confused
sometimes when editing Device Tree source files. Sorry about that.

Best regards,
Javier
