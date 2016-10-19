From: Ayaka <ayaka@soulik.info>
Subject: Re: [PATCH v9 2/2] ARM: dts: add TOPEET itop elite based board
Date: Wed, 19 Oct 2016 09:15:06 +0800
Message-ID: <58DB0A67-6C74-409B-80B2-9F02492D3A55@soulik.info>
References: <devicetree@vger.kernel.org> <1476811129-4450-1-git-send-email-ayaka@soulik.info> <1476811129-4450-3-git-send-email-ayaka@soulik.info> <20161018173748.GB30003@kozik-lap>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
        charset=big5
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from kozue.soulik.info ([108.61.200.231]:48926 "EHLO
        kozue.soulik.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755932AbcJSBPU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Oct 2016 21:15:20 -0400
In-Reply-To: <20161018173748.GB30003@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, kgene@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org



從我的 iPad 傳送

> Krzysztof Kozlowski <krzk@kernel.org> 於 2016年10月19日 上午1:37 寫道：
> 
>> On Wed, Oct 19, 2016 at 01:18:49AM +0800, Randy Li wrote:
>> The TOPEET itop exynos 4412 have three versions base board. The
>> Elite version is the cheap one without too much peripheral devices
>> on it.
>> 
>> Currently supported are serial console, wired networking(USB),
>> USB OTG in peripheral mode, USB host, SD storage, GPIO buttons,
>> PWM beeper, ADC and LEDs. The WM8960 analog audio codec is also
>> enabled.
>> 
>> The FIMC is not used for camera currently, I enabled it just for a
>> colorspace converter.
>> 
>> Signed-off-by: Randy Li <ayaka@soulik.info>
>> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Thanks, applied, with missing Rob's ack, minor changes in commit msg and
> fix in pin function (you used macro for pull up/down instead of
> function).
The last time I saw the other dts have applied that, but they are not now. A header file is also missed reported by kbuild, but I didn't meet that.
> 
> Best regards,
> Krzysztof
