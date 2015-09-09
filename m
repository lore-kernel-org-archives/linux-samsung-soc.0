From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/3] sysfs: Fix is_visible() support for binary attributes
Date: Tue, 8 Sep 2015 20:58:50 -0700
Message-ID: <20150909035850.GA5497@kroah.com>
References: <1441714066-5599-1-git-send-email-emilio.lopez@collabora.co.uk>
 <1441714066-5599-2-git-send-email-emilio.lopez@collabora.co.uk>
 <20150908153013.GA6758@roeck-us.net>
 <20150908191002.GB10156@kroah.com>
 <20150908193052.GA11106@roeck-us.net>
 <55EF82A4.5000502@collabora.co.uk>
 <55EF86F8.3060406@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:60565 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752829AbbIID7R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Sep 2015 23:59:17 -0400
Content-Disposition: inline
In-Reply-To: <55EF86F8.3060406@roeck-us.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio.lopez@collabora.co.uk>, olof@lixom.net, kgene@kernel.org, k.kozlowski@samsung.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Tue, Sep 08, 2015 at 06:10:16PM -0700, Guenter Roeck wrote:
> Hi Emilio,
>=20
> On 09/08/2015 05:51 PM, Emilio L=F3pez wrote:
> >Hi Greg & Guenter,
> >
> [ ... ]
> >>>>
> >>>>Unless I am missing something, this is not explained anywhere, bu=
t it is
> >>>>not entirely trivial to understand. I think it should be document=
ed.
> >
> >I agree. I couldn't find any mention of what this int was supposed t=
o be by looking at Documentation/ (is_visible is not even mentioned :/)=
 or include/linux/sysfs.h. Once we settle on something I'll document it=
 before sending a v2.
> >
> In the include file ? No strong preference, though.
>=20
> >By the way, I wrote a quick coccinelle script to match is_visible() =
users which reference the index (included below), and it found referenc=
es to drivers which do not seem to use any binary attributes, so I beli=
eve changing the index meaning shouldn't be an issue.
> >
> Good.
>=20
> >>>I agree, make i the number of the bin attribute and that should so=
lve
> >>>this issue.
> >>>
> >>No, that would conflict with the "normal" use of is_visible for non=
-binary
> >>attributes, and make the index all but useless, since the is_visibl=
e function
> >>would have to search through all the attributes anyway to figure ou=
t which one
> >>is being checked.
> >
> >Yeah, using the same indexes would be somewhat pointless, although n=
ot many seem to be using it anyway (only 14 files matched). Others seem=
 to be comparing the attr* instead. An alternative would be to use nega=
tive indexes for binary attributes and positive indexes for normal attr=
ibutes.
> >
> ... and I probably wrote or reviewed a significant percentage of thos=
e ;-).
>=20
> Using negative numbers for binary attributes is an interesting idea.
> Kind of unusual, though. Greg, any thoughts on that ?

Ick, no, that's a mess, maybe we just could drop the index alltogether?

thanks,

greg k-h
