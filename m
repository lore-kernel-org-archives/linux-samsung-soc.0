Return-Path: <SRS0=SgCN=7X=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13FBCC433DF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 10 Jun 2020 14:02:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7A69206F7
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 10 Jun 2020 14:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591797764;
	bh=PJeztmqH3Tm09iZIjMhIbxeolMu+TPv4gNgkyq7WC5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=CFCpdABbT1tv2I8QHGp1T+XonoQp/zDEAtHmJRpVvV7YXtnCRll3FIGhufrpgl09H
	 p9mmZWPN4uaHZPQaHhpe6rKoZkIpG4Cq+vCr2Bw7vRBwLwIWcb+EtPpPmZp9ZqHWJC
	 ccUFtKWuSMT+XpZOqMOFRsMBV1Qrj9PU2/cjf1UE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbgFJOCo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 10 Jun 2020 10:02:44 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]:40575 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726633AbgFJOCo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 10 Jun 2020 10:02:44 -0400
Received: by mail-wm1-f47.google.com with SMTP id r15so1942818wmh.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jun 2020 07:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IujImoAbQ1sAaWUW2WcFinOv2Z0Fty8ebYiABkjA+no=;
        b=CPjuClVMPSYNEvHyxsmVkf+NVxUToxbR7JULPp/oMXO0N/i+1EfeBkf3+k7y5G0sDp
         XQ7byNNlhiUUBBvZTkuIPxRL0MxU6ydwyr415oeaxCusvjomH2fV/u/YnsyZhWk1Dqtk
         ovw80wAhbfbu8ZWbuFqDEyYmmE0rZbA3Jy3CQg8/wx440N8m5leMpTmYmYq3Q7A16tpV
         0967GWQaqT7dmjMni+mlEG4mzlwGILANvUO15KOAXQ3LBhtXAvMGcKAa6siAvrWXumxw
         ahfD6cn/u6U/aCOtLxwpltnVb9HM4gygrstRGBALucTlUnqGRFrARWfhUKPSWiFeuy8m
         BtLA==
X-Gm-Message-State: AOAM531ErdzDkEp+9+ID01PVcbJqjS4j8m+/QbAEKmaRhbVTxOhMv8Th
        tbERyqUHYMCKKvrrYlfjkAI=
X-Google-Smtp-Source: ABdhPJy/FmVO48dQenPbdGoVxcnueQ5Ezi+D2vzMinBNnA+mU8HjRhyzJL7bE37NlcZ/w62odOp2sg==
X-Received: by 2002:a1c:7e02:: with SMTP id z2mr3469696wmc.116.1591797761339;
        Wed, 10 Jun 2020 07:02:41 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id h27sm9724893wrb.18.2020.06.10.07.02.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jun 2020 07:02:40 -0700 (PDT)
Date:   Wed, 10 Jun 2020 16:02:38 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Lukasz Luba <lukasz.luba@arm.com>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        s.nawrocki@samsung.com
Subject: Re: Question about Odroid XU4 cpuidle
Message-ID: <20200610140238.GA31473@kozik-lap>
References: <570c73f2-d9d8-4ae1-3caf-829547232e48@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <570c73f2-d9d8-4ae1-3caf-829547232e48@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Jun 10, 2020 at 02:18:12PM +0100, Lukasz Luba wrote:
> Hi Krzysztof, Bartek,
> 
> I recall that you have been working on some cpuidle code for Exynos(4?).
> 
> I have a question regarding CPUIdle driver for Odroid XU4.
> I use the board with LISA tests for EAS, but missing at
> least idle state 0 cause errors (please see the log below).
> 
> Currently the system does not report any idle driver and the state 0
> is missing in: /sys/devices/system/cpu/cpu0/cpuidle/state0/

The state 0 long time ago was WFI. It was kind of meaningless so it it
was dropped.

> 
> I am using driver CONFIG_ARM_BIG_LITTLE_CPUIDLE but the
> boot stops silently while trying to init the cpu idle devices in there.
> I carry on with a workaround that just removes idle state[1] and set
> state_count=1 in the big and little structures.

Try earlyprintk.

In general, the big-little cpuidle driver should work... or rather: long
time ago it was working.  It requires proper support from early stages
(BL1, secure monitor) but this should be already in standard Odroid.

I just saw there:
	/* Start at index 1, index 0 standard WFI */
so maybe it was not updated properly to removal of WFI?

I think no one uses this driver so it might be not well tested and not
that useful.

Best regards,
Krzysztof
