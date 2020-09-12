Return-Path: <SRS0=x9Fk=CV=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5586C433E2
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 12 Sep 2020 15:25:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 611C82073E
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 12 Sep 2020 15:25:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbgILPZO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 12 Sep 2020 11:25:14 -0400
Received: from smtprelay0217.hostedemail.com ([216.40.44.217]:41536 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725846AbgILPZO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 12 Sep 2020 11:25:14 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id 23EEE18224D8A;
        Sat, 12 Sep 2020 15:25:10 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: face08_0d076f6270f8
X-Filterd-Recvd-Size: 1871
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf01.hostedemail.com (Postfix) with ESMTPA;
        Sat, 12 Sep 2020 15:25:08 +0000 (UTC)
Message-ID: <da6f30896a8fd78635b3ca454d77a5292a9aa76d.camel@perches.com>
Subject: Re: [PATCH] MAINTAINERS: make linux-usb list remarks consistent
From:   Joe Perches <joe@perches.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Sat, 12 Sep 2020 08:25:07 -0700
In-Reply-To: <20200912124025.GA174230@kroah.com>
References: <20200912121346.2796-1-lukas.bulwahn@gmail.com>
         <alpine.DEB.2.21.2009121416500.3770@felia>
         <20200912124025.GA174230@kroah.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 2020-09-12 at 14:40 +0200, Greg Kroah-Hartman wrote:
> On Sat, Sep 12, 2020 at 02:19:02PM +0200, Lukas Bulwahn wrote:
> > 
> > On Sat, 12 Sep 2020, Lukas Bulwahn wrote:
> > 
> > > This patch submission will also show me if linux-usb is moderated or not.
> > > I have not subscribed to linux-usb and if it shows up quickly in the
> > > archive, the list is probably not moderated, and hence, validating the
> > > patch.
> > > 
> > 
> > The patch showed up in the archives within seconds:
> > 
> > https://lore.kernel.org/linux-usb/20200912121346.2796-1-lukas.bulwahn@gmail.com/
> > 
> > So, the linux-usb list is most likely not moderated. Patch validated.
> 
> Yes, it is not moderated, and never has been, no idea where that idea came from.

There's also linux-samsung-soc@vger.kernel.org
that is listed as moderated

Are any of the vger lists actually moderated?


