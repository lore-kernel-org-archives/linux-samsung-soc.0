Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15BAFC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 Oct 2021 21:29:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFAF460FD9
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 Oct 2021 21:29:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbhJaVbg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 31 Oct 2021 17:31:36 -0400
Received: from h04mx17.reliablemail.org ([185.76.67.210]:39285 "EHLO
        h04mx17.reliablemail.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbhJaVbf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 31 Oct 2021 17:31:35 -0400
X-Halon-Out: 911449c8-3a91-11ec-a232-556aad082471
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grimler.se;
        s=default; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=JeCHttEry3ORV5FIx1XciXwxFlHv3MV3D9HY2sgigoo=; b=CEw1tmR7b5zVP8DGoDmP1A97og
        kUwEsjE1udsGkb6Zq5XwEln1Q1L7AwXRxc+vrlawbk4eOHRDmCn1/KdKkASa5aXsZ9vXCNkThCD18
        R9vUlflwIrNeh3p0fT94eREqj4aiu3/62wSyz7g0BPNTjz70uingA/T6EfXu2yVXC/56EUhzmw6Xv
        GRiVJBhPH7XGHb1uL6GVBDe/YjWF5KoZRqduCYVUpcX9EloW0Q6ifCtFWuxeQ6TEBw22uK5aW9duw
        6lz88fISCqlxz+XI1PkxLDKkXp8P1NtBE+ZSpiuNopmFfFESQzS77TF4jyIZFUE65q+nxNbd2l143
        FGyBGCjg==;
Date:   Sun, 31 Oct 2021 22:29:00 +0100
From:   Henrik Grimler <henrik@grimler.se>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     chanho61.park@samsung.com, semen.protsenko@linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: samsung: exynos-chipid: print entire PRO_ID reg
 when probing
Message-ID: <YX8KnNl0atfDwccR@grimlerstat.localdomain>
References: <20211031165645.1182368-1-henrik@grimler.se>
 <878a4657-c68a-743e-7c89-bf69b416b824@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878a4657-c68a-743e-7c89-bf69b416b824@canonical.com>
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

Hi,

On Sun, Oct 31, 2021 at 09:35:20PM +0100, Krzysztof Kozlowski wrote:
> On 31/10/2021 17:56, Henrik Grimler wrote:
> > Older Exynos socs has one reg PRO_ID containing both product id and
> > revision information. Newer Exynos socs has one Product_ID reg with
> > product id, and one CHIPID_REV reg with revision information.
> > 
> > In commit c072c4ef7ef0 ("soc: samsung: exynos-chipid: Pass revision
> > reg offsets") the driver was changed so that the revision part of
> > PRO_ID is masked to 0 when printed during probing. This can give a
> > false impression that the revision is 0, so lets change so entire
> > PRO_ID reg is printed again.
> > 
> > Signed-off-by: Henrik Grimler <henrik@grimler.se>
> > ---
> > Has been tested on exynos4412-i9300, which is compatible with
> > exynos4210-chipid, and on an exynos8895 device compatible with
> > exynos850-chipid.
> > ---
> 
> Hi,
> 
> Thanks for the patch.
> 
> I miss here however the most important information - why do you need it?
> The answer to "why" should be in commit msg.

In dmesg we currently print something like:

    Exynos: CPU[EXYNOS4412] PRO_ID[0xe4412000] REV[0x11] Detected

where PRO_ID is given in datasheet as:

    [31:12] Product ID
      [9:8] Package information
      [7:4] Main Revision Number
      [3:0] Sub Revision Number

By printing PRO_ID[0xe4412000] it gives the impression that Package
information, Main Revision Number and Sub Revision Number are all 0.

> The change was kind of intentional and accepted, because revision ID is
> printed next to the product ID. Printing revision ID with product ID
> could be confusing...

Sure, I see the reason for only printing the product id. Would you
accept a patch write Product_ID instead of PRO_ID in the printed
message? So that we print:

    Exynos: CPU[EXYNOS4412] Product_ID[0xe4412000] REV[0x11] Detected

There's then less room for confusion regarding the revision, since
Product_ID should contain only the Product ID, unlike PRO_ID which
should contain both Product ID and revision info.

> Best regards,
> Krzysztof

Best regards,
Henrik Grimler
