Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D0F0C00528
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 24 Jul 2023 17:01:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231609AbjGXRBL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 24 Jul 2023 13:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbjGXRBD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Jul 2023 13:01:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9596419A5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Jul 2023 10:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690217985;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4nkZEjGqKMSg9XiMs6wuEiyuXPT5uFzTR3xSKZPtXrE=;
        b=QlyK6gTaCEAWtJqGf8K9gAWvPRt2qeFzY5x7ydUdFOrgR7gl9GMJAv3ksdQU5FTIpKW4L1
        D97HY3kxg3F7aCe9TqTNzLPoUbUVQEucrJ9+l1dNbi9WfyezvFzmJFx3GZf0EeYoOlk3pk
        LBP6yfNNtHdj4pMb7yjFRSwWunlNK4w=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-F6TWdedgPPOv2sepyhrg-w-1; Mon, 24 Jul 2023 12:59:44 -0400
X-MC-Unique: F6TWdedgPPOv2sepyhrg-w-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-63cf53a33a3so26954816d6.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Jul 2023 09:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690217984; x=1690822784;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4nkZEjGqKMSg9XiMs6wuEiyuXPT5uFzTR3xSKZPtXrE=;
        b=BQG0DEyIT7ikBZ7OLxUd/oGBtRgM13iRTxr5ze4FdszbqjtAqWGhCu0tmpuJuF8eRD
         gmzH0xjIl0LDFoL5sq+HOtCQyhdp+eLwUUzLutxzekg6oU+2yHjZjWtKC5LUGP9Jn7UT
         eXx60kNsmHA1m93EJKlO1Kxylc9v6U2C5QLH3a7ji5Bsy9SXiw9HV/X0XtDQZztigATu
         BXbpQYH34/4ZC6sn0PXtM6NilkrQuJMThHSb9J6UhvYurG1le5lOiid7vrk3Qq85xIPX
         wx1SkrutxbdIiOlfgmfgqxhxaOmxR06vBt9ugfwZE8JDi921eMfr6PjCZfI20a0F9NE/
         YM6g==
X-Gm-Message-State: ABy/qLZiEYF3fcXx8lkiGvflAH7Uq199ZBnXQJApOUwOGGuXrc5ppgMs
        iqt4H2H93Au0FyOk/cBN9h5bfjw6iN85EJr4QfQDhfGgN0Fs1eKASoV6xLyd6NXoFNUQtqjclLl
        y3/+5AldInsNSTdOVIj7N73Rgcn8kdPY=
X-Received: by 2002:a05:6214:4a4d:b0:63c:8afd:7273 with SMTP id ph13-20020a0562144a4d00b0063c8afd7273mr349408qvb.12.1690217984343;
        Mon, 24 Jul 2023 09:59:44 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFO7x4sJQe6yNcwbJzHDwKetm24F7RG9qQSBeAxMG+DYnqfAzn8WMDsH6icpFD+s4FFI4gTGA==
X-Received: by 2002:a05:6214:4a4d:b0:63c:8afd:7273 with SMTP id ph13-20020a0562144a4d00b0063c8afd7273mr349393qvb.12.1690217984140;
        Mon, 24 Jul 2023 09:59:44 -0700 (PDT)
Received: from brian-x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id v14-20020a0cdd8e000000b0062ffcda34c6sm3670040qvk.137.2023.07.24.09.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 09:59:43 -0700 (PDT)
Date:   Mon, 24 Jul 2023 12:59:42 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Mukesh Ojha <quic_mojha@quicinc.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        lkml <linux-kernel@vger.kernel.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: Feedback on Qualcomm's minidump (debug) solution for end user
 device crash
Message-ID: <ZL6t/sZTZBfvSYOm@brian-x1>
References: <0199db00-1b1d-0c63-58ff-03efae02cb21@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0199db00-1b1d-0c63-58ff-03efae02cb21@quicinc.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

+ linux-arm-kernel list

On Thu, Jul 20, 2023 at 08:32:24PM +0530, Mukesh Ojha wrote:
> Hi Samsung/MTK/Any other SOC vendors,
> 
> This is to bring to your notice that, we (Qualcomm) are working on
> upstreaming our minidump solution which is to address the problem of
> debugging on field device crashes where collecting entire ddr dump
> would not be feasible and collecting minimal data from the ddr would
> help in debug direction or even help in root causing issue.
> 
> We have recently posted v4 version here [1]
> 
> Based on comments[2], community is more worried about, if each SOC
> vendor come up with their own dumping method today or in future and
> whether it can have a common solution to a similar problem faced by
> other SOC vendor.
> 
> We wanted to take your feedback if you also encounter a similar problem
> or maintain something similar solution in downstream which can be
> upstreamed. This will help us in a way to have a common solution in
> upstream.
> 
> [1]
> https://lore.kernel.org/lkml/10dd2ead-758a-89f0-cda4-70ae927269eb@quicinc.com/
> 
> [2]
> https://lore.kernel.org/lkml/CAL_JsqLO9yey2-4FcWsaGxijiS6hGL0SH9VoMuiyei-u9=Cv=w@mail.gmail.com/

Adding the main ARM list to solicit feedback from other silicon
manufacturers.

The cover sheet on the v4 patch set is available at:
https://lore.kernel.org/lkml/1687955688-20809-1-git-send-email-quic_mojha@quicinc.com/

Brian

