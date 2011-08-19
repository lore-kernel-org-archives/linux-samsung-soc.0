From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: S3C64XX: Remove un-used code
Date: Fri, 19 Aug 2011 13:53:47 +0900
Message-ID: <20110819045346.GA26979@opensource.wolfsonmicro.com>
References: <1313498488-4296-1-git-send-email-banajit.g@samsung.com>
 <20110819015955.GA1212@sirena.org.uk>
 <CABK8_vR6bB_0TfQtbA7F9+w9dSXajMdd1SS5o+LscMrDcCY1tg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:51818 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750859Ab1HSEyw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Aug 2011 00:54:52 -0400
Content-Disposition: inline
In-Reply-To: <CABK8_vR6bB_0TfQtbA7F9+w9dSXajMdd1SS5o+LscMrDcCY1tg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Banajit Goswami <banajit.goswami@gmail.com>
Cc: Banajit Goswami <banajit.g@samsung.com>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

On Fri, Aug 19, 2011 at 09:40:29AM +0530, Banajit Goswami wrote:
> On Fri, Aug 19, 2011 at 7:29 AM, Mark Brown
> <broonie@opensource.wolfsonmicro.com> wrote:
> > On Tue, Aug 16, 2011 at 06:11:28PM +0530, Banajit Goswami wrote:
> >> Remove un-used backlight code for SMDK6410 board

> > Is the data actually wrong? =A0If not it'd seem better to finish ho=
oking
> > it up properly than to remove it.

> No, this code is no longer needed, as we are having a common backligh=
t
> infrastructure , which serves the same purpose.

Ideally your commit log should make this clear - it looks like you're
just deleting unreferenced code.
