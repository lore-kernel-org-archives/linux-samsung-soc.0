Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427F3C433DB
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 22 Feb 2021 06:04:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 078F264E5F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 22 Feb 2021 06:04:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbhBVGEU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 22 Feb 2021 01:04:20 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:45006 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbhBVGER (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 22 Feb 2021 01:04:17 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11M5wOq3147408;
        Mon, 22 Feb 2021 06:03:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=A1UELqL1BspiLQToozAhp0VlUUTUJUEMj22TOJGavrI=;
 b=NU20WW8JxBpeGanOVSdifZkKjLNYWZQKkddVfOcjf6oMmZUDqAvCFu5s3s0Pb1xAGZ2N
 vyTlN+6WWAh45UJg8J1zOeXVcKSULMT9Pb3+j41AE76vhrjtzDHQVEVFtEwKaiWS/V0f
 9FmIqW5hmeY9UIOUjMhFPdkDcDtkxQg64D/UCmxnGnUgSR0QTlzLERfSWDsq2C/FGvYI
 7B6neYhbGlNMa9lK72QP1iBUVbV1B9PZbayuTHmrkdKt64wHKuBm7iZyw7liwbmzA3ow
 YbDj87VsAjRS7MRuty8QvkJygaB7G+nZgSOygWQCeSGacNMkBG6QdQ+tSGtur/fhiPLK fA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 36ugq39a1v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Feb 2021 06:03:21 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11M5sd9C049366;
        Mon, 22 Feb 2021 06:03:19 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 36uc0kusj0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Feb 2021 06:03:19 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 11M63C8J010574;
        Mon, 22 Feb 2021 06:03:12 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sun, 21 Feb 2021 22:03:12 -0800
Date:   Mon, 22 Feb 2021 09:03:03 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, krzk@kernel.org,
        nathan@kernel.org, ndesaulniers@google.com, arnd@arndb.de,
        gustavoars@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: gadget: s3c: Fix incorrect resources releasing
Message-ID: <20210222060302.GI2087@kadam>
References: <20210221074117.937965-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210221074117.937965-1-christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9902 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102220054
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9902 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 clxscore=1011 impostorscore=0 lowpriorityscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102220054
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Feb 21, 2021 at 08:41:17AM +0100, Christophe JAILLET wrote:
> Since commit fe0f8e5c9ba8 ("usb: gadget: s3c: use platform resources"),

This the wrong hash.  It should be 188db4435ac6 from the URL you posted
below.

regards,
dan carpenter

