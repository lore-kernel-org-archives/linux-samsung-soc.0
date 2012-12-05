From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH v2] ARM: DTS: CROS5250: Add max77686 device tree support
Date: Wed, 5 Dec 2012 08:38:07 +0530
Message-ID: <CAM4voak90pjZkGGY=gyc=+zNXRu_kUOjhqUM106OnfhLfa5hHw@mail.gmail.com>
References: <1354099900-24779-1-git-send-email-a.kesavan@samsung.com>
	<1354627096-9433-1-git-send-email-a.kesavan@samsung.com>
	<CAD=FV=VRPwuaOJrjGvtWzRQfb=NYsmP9Vfyk8jsxTMTv=6Pa7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f174.google.com ([209.85.216.174]:48707 "EHLO
	mail-qc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752810Ab2LEDII (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Dec 2012 22:08:08 -0500
Received: by mail-qc0-f174.google.com with SMTP id o22so2484382qcr.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Dec 2012 19:08:07 -0800 (PST)
In-Reply-To: <CAD=FV=VRPwuaOJrjGvtWzRQfb=NYsmP9Vfyk8jsxTMTv=6Pa7A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: olof@lixom.net, linux-samsung-soc@vger.kernel.org, thomas.abraham@linaro.org, linux-arm-kernel@lists.infradead.org, rahul.sharma@samsung.com

Hi Doug,

[...]
>> +
>> +                               ldo7_reg: LDO7 {
>> +                                       regulator-name = "P1.0V_LDO_OUT7";
>> +                                       regulator-min-microvolt = <1100000>;
>> +                                       regulator-max-microvolt = <1100000>;
>> +                                       regulator-always-on;
>> +                               };
>
> This matches the signal name on the most recent schematics, which is
> good, but I'd be slightly happier if it said "1.1V" in instead of
> 1.0V.  I'd imagine that if we ever rev the schematics that we'd fix
> that.
Will change to 1.1
[...]
> ...would love to see LDO7 name fixed up, but otherwise looks good to
> me.  Thanks!
>
> Acked-by: Doug Anderson <dianders@chromium.org>
Will re-post with your ACK.

Abhilash
