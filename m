From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH] NFC: Driver for SAMSUNG S3FHRN2 NFC Chip.
Date: Tue, 5 Jun 2012 10:59:19 +0200
Message-ID: <20120605085919.GI27105@sortiz-mobl>
References: <001201cd42ef$c283d8d0$478b8a70$%lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:34273 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758094Ab2FEIsx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jun 2012 04:48:53 -0400
Content-Disposition: inline
In-Reply-To: <001201cd42ef$c283d8d0$478b8a70$%lee@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?B?77+9zL/vv73vv73vv70=?= <woonki84.lee@samsung.com>
Cc: linux-wireless@vger.kernel.org, linux-samsung-soc@vger.kernel.org, lauro.venancio@openbossa.org, aloisio.almeida@openbossa.org, kgene.kim@samsung.com

Hi WoonKi,

On Tue, Jun 05, 2012 at 04:49:38PM +0900, =EF=BF=BD=CC=BF=EF=BF=BD=EF=BF=
=BD=EF=BF=BD wrote:
> This is a driver for the S3FHRN2 NFC device. the driver is just a
> proxy getting SHDLC/HCI frames from a userspace stack.
>=20
> Signed-off-by: WoonKi Lee <woonki84.lee@samsung.com>
NACK from me. We started the NFC subsystem to avoid having a new and di=
fferent
ad-hoc API for each and every NFC driver, and that's what you're doing =
right
here.
Until this driver gets converted to the kernel NFC APIs, it should live=
 in the
staging directory.

Cheers,
Samuel.

--=20
Intel Open Source Technology Centre
http://oss.intel.com/
