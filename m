From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v3 2/2] regulator: add device tree support for max8997
Date: Tue, 13 Mar 2012 12:18:03 -0600
Message-ID: <20120313181803.B45073E053B@localhost>
References: <1330000688-11226-1-git-send-email-thomas.abraham@linaro.org> <1330000688-11226-3-git-send-email-thomas.abraham@linaro.org> <20120313034306.16CF73E07E4@localhost> <CAJuYYwRAXyU7d7qhGUX-=qWUJ0M1KB3XCGPOnUxToP=0XOhzqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:59982 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759358Ab2CMSSN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Mar 2012 14:18:13 -0400
Received: by eekc41 with SMTP id c41so499044eek.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Mar 2012 11:18:12 -0700 (PDT)
In-Reply-To: <CAJuYYwRAXyU7d7qhGUX-=qWUJ0M1KB3XCGPOnUxToP=0XOhzqg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-kernel@vger.kernel.org, k.lewandowsk@samsung.com, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, dg77.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Rajendra Nayak <rnayak@ti.com>

On Tue, 13 Mar 2012 12:14:42 +0530, Thomas Abraham <thomas.abraham@lina=
ro.org> wrote:
> On 13 March 2012 09:13, Grant Likely <grant.likely@secretlab.ca> wrot=
e:
> > On Thu, 23 Feb 2012 18:08:08 +0530, Thomas Abraham <thomas.abraham@=
linaro.org> wrote:
> > Otherwise, the patch looks pretty good. =C2=A0(although seeing the =
decode function
> > has got me thinking that we need a much better way of decoding the =
dt data).
>=20
> The parsing function looks huge since there is lot of data to pick up
> from the dt node.

Oh, I understand that you have to do it this way; I just think the core=
 code
should make it a lot easier.  :-)

g.
