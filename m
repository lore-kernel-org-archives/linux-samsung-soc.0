From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v3 6/6] mfd: cros_ec: Instantiate sub-devices from device
 tree
Date: Mon, 29 Sep 2014 09:33:27 +0200
Message-ID: <54290B47.2030907@collabora.co.uk>
References: <1410428289-18229-1-git-send-email-javier.martinez@collabora.co.uk> <1410428289-18229-7-git-send-email-javier.martinez@collabora.co.uk> <20140917163114.GL30918@lee--X1> <541A8E88.6050707@collabora.co.uk> <20140919001512.GA29852@lee--X1> <54241E74.9000403@collabora.co.uk> <20140925144846.GC21351@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:47224 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751403AbaI2Hdf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Sep 2014 03:33:35 -0400
In-Reply-To: <20140925144846.GC21351@lee--X1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Doug Anderson <dianders@chromium.org>, Simon Glass <sjg@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Andrew Bresticker <abrestic@chromium.org>, Derek Basehore <dbasehore@chromium.org>, Todd Broch <tbroch@chromium.org>, Olof Johansson <olof@lixom.net>, Andreas Faerber <afaerber@suse.de>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Hello Lee,

On 09/25/2014 04:48 PM, Lee Jones wrote:
> On Thu, 25 Sep 2014, Javier Martinez Canillas wrote:
>> 
>> Understood, that's why I dropped this since as explained earlier, it makes more
>> sense to include this change once the cros_ec_dev driver is pushed to upstream.
>> 
>> The last version of the series (v4) I posted a week ago [0], does not include
>> this patch so I hope the series can be picked for 3.18 since most of the patches
>> were already acked by you.
> 
> Unfortunately this is going to have to wait until v3.19 now, as Linus
> is closing the -rcs early.  I have subsequently applied my last
> patch to the MFD tree for v3.18.  It will be good for these patches to
> get some soak testing in -next anyway, rather than rush them in.
> 

I don't want to be annoying but I was just wondering if now that Linus has
delayed the 3.18 merge window for two weeks [1], you will consider picking
this series. Most of the patches have been acked by you a couple of weeks
ago anyways and I dropped $subject from the last version of the series [2],
which was the patch you had issues with.

It would be awesome if this can make it to 3.18 so we can start adding the
missing functionality and target it to 3.19.

Thanks a lot and best regards,
Javier

[1]: http://thread.gmane.org/gmane.linux.kernel/1797057
[2]: https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg36770.html
