Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C50C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 24 Jan 2022 15:22:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235204AbiAXPWp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 24 Jan 2022 10:22:45 -0500
Received: from h02mx15.reliablemail.org ([185.76.66.168]:26634 "EHLO
        h02mx15.reliablemail.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235210AbiAXPWp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Jan 2022 10:22:45 -0500
X-Halon-Out: 79ad4dbc-7d29-11ec-930f-f5be715b97e5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grimler.se;
        s=default; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=e9Lg4dhVGMbQ5xMPuQv5VxS25dUYKwL5nMS2Ac0GJbY=; b=U1aYMiVz3R8LLf4iUkahvuH4im
        adgSdvpYMTF7yKWVhU4dfOR8lZdqoYVGxZmtzTsJKno9LwyvuEW4BAC51J+zmIVDxL10VXhyUkKTE
        pdJ+NrNjslNV+Uzap5BnRQsctue6OvxrKLxgycB/II+T7S5O/kOQQrzLfCKalZtunjSvZPAKYm1ND
        DaxlhdTXadbTR0zNWKpcR9LCl/m/2OaLu6hq2WnJcIy/2xMgvYawCpZc7Cqk9qQmBCSSRajO+3/wr
        hfvRgRW6EtpudGS8QOBW5pXd3p8XQYnUeT7qXMj7gNxc3b5eMJcDsn6gLrWQ3aJXE21XFMg74aCQC
        9AJNnl1g==;
Date:   Mon, 24 Jan 2022 16:22:41 +0100
From:   Henrik Grimler <henrik@grimler.se>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH] drm/exynos: Search for TE-gpio in DSI panel's node
Message-ID: <Ye7EQRefzECSqVOe@grimlerstat>
References: <CGME20220124135259eucas1p1ed3c76ef23d30afe620e06a419540c9e@eucas1p1.samsung.com>
 <20220124135246.6998-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124135246.6998-1-m.szyprowski@samsung.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpsrv07.misshosting.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - grimler.se
X-Get-Message-Sender-Via: cpsrv07.misshosting.com: authenticated_id: henrik@grimler.se
X-Authenticated-Sender: cpsrv07.misshosting.com: henrik@grimler.se
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek,

On Mon, Jan 24, 2022 at 02:52:46PM +0100, Marek Szyprowski wrote:
> TE-gpio, if defined, is placed in the panel's node, not the parent DSI
> node. Change the devm_gpiod_get_optional() to gpiod_get_optional() and
> pass proper device node to it. The code already has a proper cleanup
> path, so it looks that the devm_* variant has been applied assidentally
                                                             ~~~~~~~~~~~~
Small observation: the spelling above should probably be    "accidentally".

> during the conversion to gpiod API.

Best regards,
Henrik Grimler
