From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/4] sysfs: Support is_visible() on binary attributes
Date: Sun, 4 Oct 2015 19:33:34 +0100
Message-ID: <20151004183334.GA23538@kroah.com>
References: <1442842703-5309-1-git-send-email-emilio.lopez@collabora.co.uk>
 <1442842703-5309-2-git-send-email-emilio.lopez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:42582 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751453AbbJDSdk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 4 Oct 2015 14:33:40 -0400
Content-Disposition: inline
In-Reply-To: <1442842703-5309-2-git-send-email-emilio.lopez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio.lopez@collabora.co.uk>
Cc: olof@lixom.net, kgene@kernel.org, k.kozlowski@samsung.com, linux@roeck-us.net, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Mon, Sep 21, 2015 at 10:38:20AM -0300, Emilio L=F3pez wrote:
> According to the sysfs header file:
>=20
>     "The returned value will replace static permissions defined in
>      struct attribute or struct bin_attribute."
>=20
> but this isn't the case, as is_visible is only called on struct attri=
bute
> only. This patch introduces a new is_bin_visible() function to implem=
ent
> the same functionality for binary attributes, and updates documentati=
on
> accordingly.
>=20
> Note that to keep functionality and code similar to that of normal
> attributes, the mode is now checked as well to ensure it contains onl=
y
> read/write permissions or SYSFS_PREALLOC.
>=20
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Emilio L=F3pez <emilio.lopez@collabora.co.uk>

As this should probably go through the "platform drivers" maintainer,
I'll just give you this:

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

So it can go through their tree and not require me to just take this
one.

thanks,

greg k-h
