Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC9DC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 23 Feb 2021 21:29:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 789CD64E83
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 23 Feb 2021 21:29:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233688AbhBWV3Y (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 23 Feb 2021 16:29:24 -0500
Received: from smtp12.smtpout.orange.fr ([80.12.242.134]:23870 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233954AbhBWV3S (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 23 Feb 2021 16:29:18 -0500
Received: from [192.168.1.18] ([90.126.17.6])
        by mwinf5d35 with ME
        id YlTY2400B07rLVE03lTZkE; Tue, 23 Feb 2021 22:27:36 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 23 Feb 2021 22:27:36 +0100
X-ME-IP: 90.126.17.6
Subject: Re: [PATCH 1/2] usb: gadget: s3c: Fix incorrect resources releasing
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, krzk@kernel.org,
        nathan@kernel.org, ndesaulniers@google.com, arnd@arndb.de,
        gustavoars@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Newsgroups: gmane.linux.kernel.samsung-soc,gmane.linux.ports.arm.kernel,gmane.linux.usb.general,gmane.linux.kernel,gmane.linux.kernel.janitors
References: <20210221074117.937965-1-christophe.jaillet@wanadoo.fr>
 <20210222060302.GI2087@kadam>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <6135522c-11e9-a2ba-2d5e-b46068aa6d3f@wanadoo.fr>
Date:   Tue, 23 Feb 2021 22:27:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210222060302.GI2087@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Le 22/02/2021 à 07:03, Dan Carpenter a écrit :
> On Sun, Feb 21, 2021 at 08:41:17AM +0100, Christophe JAILLET wrote:
>> Since commit fe0f8e5c9ba8 ("usb: gadget: s3c: use platform resources"),
> 
> This the wrong hash.  It should be 188db4435ac6 from the URL you posted
> below.
> 
> regards,
> dan carpenter
> 
> 
Ouch!

Thx for spotting this so stupid and so trivial little error!
I'll send a v2 when -rc1 is out.

CJ
