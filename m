Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B32C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 20 Oct 2021 06:30:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86F4161183
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 20 Oct 2021 06:30:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbhJTGcd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 20 Oct 2021 02:32:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:48372 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229591AbhJTGcd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Oct 2021 02:32:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11EC36115A;
        Wed, 20 Oct 2021 06:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634711419;
        bh=tllcKVdOCf1880LUhvS7XrPGcwtfJQbGlrVjX9YMtt8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=m3/sLdGDb5JoeBwHZroAOE5md4OeTg6ihclpVaa41kJVBjbUtQoMyz8gW9sQOCrw9
         UU8KQu0G1XO0Picbov8U/nr5/ew7INb49eRccpuXbXbigiFoPmaqrtpclgUiF4y5ny
         CN201CfNQKLxyi7kwel6rGGDZmoFR9z/iyIcuCf2Nx4PbsbbxS8VxNWrIWOBrs6lnH
         4FnNoq+UySwnBnkVv9RiLdpi+L0NwY05wp6pigH3HpXpNyjrM+Vfu2eUexXo/ZebxA
         52OMYFt0VoErTF9d1G7Bq7aDHIVVFDnKWDpxp0LWta3Br96tg2c/Q/OXG4QmdjlRCx
         A8Fo4fmJpolqg==
Date:   Wed, 20 Oct 2021 07:30:13 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 21/23] regulator: dt-bindings: update
 samsung,s2mpa01.yaml reference
Message-ID: <20211020073013.6d144c0d@sal.lan>
In-Reply-To: <YW60a8z0JNDnTLV/@sirena.org.uk>
References: <cover.1634630485.git.mchehab+huawei@kernel.org>
        <9acc235dc4af794d18e1267371944a3955e1fb21.1634630486.git.mchehab+huawei@kernel.org>
        <YW60a8z0JNDnTLV/@sirena.org.uk>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Em Tue, 19 Oct 2021 13:04:59 +0100
Mark Brown <broonie@kernel.org> escreveu:

> On Tue, Oct 19, 2021 at 09:04:20AM +0100, Mauro Carvalho Chehab wrote:
> 
> > To mailbombing on a large number of people, only mailing lists were C/C on the cover.
> > See [PATCH v3 00/23] at: https://lore.kernel.org/all/cover.1634630485.git.mchehab+huawei@kernel.org/  
> 
> It'd be a bit easier to put a note in here about what the dependencies
> are rather than forcing people to go out to a link to figure out what's
> going on unless it's complicated. 
>
> For a case like this where there's no
> dependencies or real relationship between the patches it's probably
> better to just not thread everything and send the patches separately to
> everyone, the threading is just adding noise and confusion.

It is not that easy, unfortunately. On some cases (specially due to
DT binding renames) some patches change the context of a hunk, affecting
a subsequent patch.

I tried a couple of times in the past to send the patches individually,
but that was messier, as there was harder for people to apply them,
as, instead of running b4 just once to get everything, maintainers
would need to apply each patch individually. Also, there were cases
where the patch order would be relevant, due to context changes.

-

Btw, talking about what it would be easier, the best procedure to
adopt is to run:

	./scripts/documentation-file-ref-check 

Before sending/applying patches touching documents.

That would avoid the need of such fixup patches ;-)

Unfortunately, in the specific case of dt-bindings, things are not
that easy, as doc changes usually go via one tree, while references 
to them come from other places.

Regards,
Mauro
