From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RESEND PATCH 4/8] mfd: cros_ec: Use a zero-length array for
 command data
Date: Thu, 16 Apr 2015 11:55:15 +0200
Message-ID: <552F8703.2030200@collabora.co.uk>
References: <1428336906-14906-1-git-send-email-javier.martinez@collabora.co.uk> <1428336906-14906-5-git-send-email-javier.martinez@collabora.co.uk> <3714344.xf4aIv3C10@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:37497 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753473AbbDPJzV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Apr 2015 05:55:21 -0400
In-Reply-To: <3714344.xf4aIv3C10@diego>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?windows-1252?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Olof Johansson <olof@lixom.net>, Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Gwendal Grignou <gwendal@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Heiko,

[snip]

On 04/16/2015 11:45 AM, Heiko St=FCbner wrote:
>=20
>>  /* Module initialization */
>> @@ -269,3 +301,4 @@ void ec_dev_sysfs_remove(struct cros_ec_device *=
ec)
>>  {
>>  	sysfs_remove_group(&ec->vdev->kobj, &ec_attr_group);
>>  }
>> +
>=20
> .git/rebase-apply/patch:893: new blank line at EOF.
>=20
>=20

Thanks for pointing out this, I'll fix it when re-posting after 4.1-rc1=
=2E

Best regards,
Javier
