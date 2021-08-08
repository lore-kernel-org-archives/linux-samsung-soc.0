Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D2E6C4338F
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  8 Aug 2021 21:01:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 433A960F42
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  8 Aug 2021 21:01:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbhHHVBo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 8 Aug 2021 17:01:44 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:43440 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbhHHVBn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 8 Aug 2021 17:01:43 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 1A0D220DE938
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH 4/9] usb: gadget: udc: s3c2410: add IRQ check
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
CC:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>
References: <717ddd7c-22cd-d82c-e43d-80254718c801@omp.ru>
 <f704a632-a970-fe8d-35e7-f4d032c670c7@omp.ru>
Organization: Open Mobile Platform
Message-ID: <7ba95c65-416c-2b55-b004-bf87b91288d7@omp.ru>
Date:   Mon, 9 Aug 2021 00:01:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <f704a632-a970-fe8d-35e7-f4d032c670c7@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Oops, duplicate patch. Scratch the series, I'm going to restart posting tomorrow... :-)
