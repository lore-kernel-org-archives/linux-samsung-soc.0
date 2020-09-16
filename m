Return-Path: <SRS0=Wlns=CZ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MALFORMED_FREEMAIL,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9CCC2BB84
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 16 Sep 2020 19:46:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC755208E4
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 16 Sep 2020 19:46:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vt6Oq8ze"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbgIPTqT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 16 Sep 2020 15:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728132AbgIPTqE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 15:46:04 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96A32C061756;
        Wed, 16 Sep 2020 12:46:03 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id c18so8090118wrm.9;
        Wed, 16 Sep 2020 12:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=mU3cDRgq1g+naNQJ65S1yYLb8Rp53s6t2LxJPp49zWA=;
        b=Vt6Oq8zeEuG/NWaeBhvUWE2AJ2AKtiKaRMFE8doEFs7OExE43Atoo1dUuG0mdNPjwJ
         ycmZ70J5ZiMpPu0etB8IbbYNiz5iBq8hgJ7dgZcg+gHwdK24Z5D34Y2FxweWS26c53/M
         HADWTkMohnHg85pNmyjMr9Szm7+MwMVSotQNViWkU3h4n+srw4RMxXj5W/N48STAWEGb
         A2KHZQpHAw4aDRF4Ksu+12BShSMRK7PmFdMR5W75t30KOmGkbm2Y++cQJQJrVlNuB+Zz
         9qhAv5bwBflaWR7x70AKH4lBlDyRe2Bts4ed1rfaROuTVY1SXZq2cJmyfRQ2W1Cx3uCl
         2MiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=mU3cDRgq1g+naNQJ65S1yYLb8Rp53s6t2LxJPp49zWA=;
        b=oQP+aA38B8A4Qp+ZMh9RMxWyL0loQUcQGoi1f/F5RFcaMGaMDTkro/Spg04oXeAS4a
         5W4PTFfh/aT7m2eKREAtAKA8K3O1a/lW1uQ3T7fNpx9OAriSo53DOcAzXZRksdtGbR+U
         kZts9DsrHquDwDvSzmgZWlgCF+f3/kGCich2FYjU4SfGACV3C2vrsIbpnU2Pa+pcx9PI
         JjilYwZxFct8eBej8t2xP+Joj3V/dum+DqyvtH9iq/i7MaiCcPsoOvEkdoaCADoufM/0
         B6T8wH39eyGpjMEkzQR4aQ2S0TQpEqhfGIFleruULgrUGcDy8Gqrfubf1bn9BD63kecd
         Bg0Q==
X-Gm-Message-State: AOAM533BEoTkCD5vi4uAiP19bOIXx8jf8vHw3y5Y4hgNh0crZ8SD16/9
        OtPD2abWL0MGgJnY6RO63UjDxEfiYBLNToW3
X-Google-Smtp-Source: ABdhPJwNaHgbIj6yxFA2Wq4aPyuBf4vwFexHZq931I2pE5PXLB2U27wQ4EaOq4SkTwv8DQ98ZtPjjA==
X-Received: by 2002:a5d:608f:: with SMTP id w15mr5463281wrt.244.1600285562177;
        Wed, 16 Sep 2020 12:46:02 -0700 (PDT)
Received: from felia ([2001:16b8:2dec:c500:3c50:8c2f:cc8a:657a])
        by smtp.gmail.com with ESMTPSA id 2sm6765364wmf.25.2020.09.16.12.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 12:46:01 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date:   Wed, 16 Sep 2020 21:45:55 +0200 (CEST)
X-X-Sender: lukas@felia
To:     Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        linux-samsung-soc@vger.kernel.org,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: mark linux-samsung-soc list non-moderated
In-Reply-To: <20200916165357.GA18287@kozik-lap>
Message-ID: <alpine.DEB.2.21.2009162140130.14568@felia>
References: <20200914061353.17535-1-lukas.bulwahn@gmail.com> <20200916165357.GA18287@kozik-lap>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



On Wed, 16 Sep 2020, Krzysztof Kozlowski wrote:

> On Mon, Sep 14, 2020 at 08:13:53AM +0200, Lukas Bulwahn wrote:
> > In fifteen entries mentioning linux-samsung-soc@vger.kernel.org in
> > MAINTAINERS, seven entries mention the list being moderated for
> > non-subscribers and eight entries do not. Clearly only one can be right,
> > though.
> > 
> > Joe Perches suggested that all vger.kernel.org are not moderated for
> > non-subscribers.
> > 
> > Remove all the remarks from the entries following Joe's suggestion.
> > 
> > Link: https://lore.kernel.org/lkml/da6f30896a8fd78635b3ca454d77a5292a9aa76d.camel@perches.com/
> > Suggested-by: Joe Perches <joe@perches.com>
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> > applies cleanly on v5.9-rc5 and next-20200911
> > 
> > Krzysztof, please pick this minor non-urgent cleanup patch.
> > 
> > This patch submission will also show me if linux-samsung-soc is moderated
> > or not. I have not subscribed to linux-samsung-soc and if it shows up
> > quickly in the archive, the list is probably not moderated, and hence,
> > validating the patch.
> 
> Please use scripts/get_maintainers.pl (for example on files in modified
> maintainers section) to get the addresses of people.  This mail missed
> all my filters and got archived immediately because you sent it to
> unusual address (how did you get this address, BTW? It does not appear
> in the sources since few years).
>

Sorry, I usually do use ./scripts/get_maintainers.pl and you are right 
there is no way one could pick up that email address from the repository.

It was difficult to recall where I got the address from, but then I 
finally remembered.

I wanted to know who is responsible for the linus-samsung-soc mailing 
list for this patch. So I went to:

https://patchwork.kernel.org/project/linux-samsung-soc/

And there in 'About this project', it still lists your gmail address. I 
did not crosscheck that mail address with .mailmap, get_maintainers.pl 
etc., but just send the patch out.

> Thanks, applied.

I am happy it reached you despite this mess-up on my side.

Lukas
