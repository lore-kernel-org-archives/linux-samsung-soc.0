From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 7/8] s3c-hsudc: use release_mem_region instead of
	release_resource
Date: Tue, 20 Dec 2011 21:19:08 +0000
Message-ID: <20111220211908.GG2577@n2100.arm.linux.org.uk>
References: <201112191938.22254.heiko@sntech.de> <201112191942.52629.heiko@sntech.de> <20111220201049.GB2577@n2100.arm.linux.org.uk> <20111220210947.GA7352@legolas.emea.dhcp.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:58782 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750703Ab1LTVTl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Dec 2011 16:19:41 -0500
Content-Disposition: inline
In-Reply-To: <20111220210947.GA7352@legolas.emea.dhcp.ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>
Cc: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-arm-kernel@lists.infradead.org

On Tue, Dec 20, 2011 at 11:09:48PM +0200, Felipe Balbi wrote:
> On Tue, Dec 20, 2011 at 08:10:49PM +0000, Russell King - ARM Linux wr=
ote:
> > On Mon, Dec 19, 2011 at 07:42:52PM +0100, Heiko St=FCbner wrote:
> > > As the memory region is requested through request_mem_region
> > > use the correct paired method to release it in the error path
> > > and don't go "beneath the API" as pointed out by Russel King.
> >=20
> > Please correct the spelling, thanks.
>=20
> Just did, do you prefer that I add a Reported-by: Russell instead of
> that mention ?

If you wish - I don't mind.  If you do, please use an email address
of rmk+kernel@arm.linux.org.uk in the attributations.  Thanks.
