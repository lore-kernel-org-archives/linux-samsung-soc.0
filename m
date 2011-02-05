From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: USB: Gadget: COMPOSITE: Debug interface number
Date: Sat, 5 Feb 2011 09:39:28 +0900
Message-ID: <AANLkTim0tw1-R8efq1Cir4v80rbZ_AbOemG=zV=NsKDF@mail.gmail.com>
References: <AANLkTimhnJ1dVK8yMz2S7R7r86xYjRSpD=cEx_weh_J1@mail.gmail.com>
	<20110204195822.GA30229@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:51616 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751446Ab1BEAja convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Feb 2011 19:39:30 -0500
In-Reply-To: <20110204195822.GA30229@kroah.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-usb@vger.kernel.org, david-b@pacbell.net, gregkh@suse.de, stern@rowland.harvard.edu, maulik@ti.com, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On Sat, Feb 5, 2011 at 4:58 AM, Greg KH <greg@kroah.com> wrote:
> On Fri, Feb 04, 2011 at 06:50:27PM +0900, Jassi Brar wrote:
>> Hi,
>>
>> The commit 'avoid access beyond array max length' incorrectly
>> compares w_index with MAX_CONFIG_INTERFACES. Whereas only
>> lower 8bits of w_index refer to the interface number.
>> So, use 'intf' rather than 'w_index' for comparison.
>
> Why did you attach the patch in base64 mode? =C2=A0Please fix your em=
ail
> client to not do this and send it to me in a format that I can apply =
it
> in.
>
> Try using 'git send-email' instead.

I always use git send-email, only this time the network connectivity is=
 down
and immediate fix out of sight due to long holiday season here. So, I h=
ad
to send it as an attachment.
Will resend next week by git send-email.

Thanks
