Return-Path: <SRS0=sBhj=24=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854ADC282DD
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jan 2020 20:15:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5C85E222D9
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jan 2020 20:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578428124;
	bh=ioWF1Mb57vZhN8n6WoxrTNQ0w/n4DAaVfx2HyPwwe4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=rkCGPh/gOzOatPz2FrtTmtmzJ9iJdJ8eqEQUZXeKqmR9PCZInSKc1KoTyBIemhtkD
	 j/TDMfpwBVthU5UwDU0DIbcW9Wcad0b3wV+M/ZeCcK8byQU/Nqu8nMqsEcQ/TZYdgM
	 BdWdBrB5l9thSQNFseQ5zmkQ111mu85Zoau2K610=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728384AbgAGUPV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jan 2020 15:15:21 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:43583 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728421AbgAGUPV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jan 2020 15:15:21 -0500
Received: by mail-ed1-f66.google.com with SMTP id dc19so642053edb.10;
        Tue, 07 Jan 2020 12:15:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wGDNH8G9OjiK3AAd62wDz3jw6gfDHFXfcH+EuJ758p0=;
        b=aiRJKqPwWjNrSG0nR21snNm/EpcBQbxC7Jb/7DDOjd1QYneedzPRiYiKkDNWrJj6ii
         S5qdDyQ5TBmNeSX3k9FE6LyiAPg5r7GmTtOFUaglJjCE5ZTkX1Nbfh9RWqVzyxgLbIYp
         GK9YwRguDnrKpYj7KAkIqhH2fVCORusDJgx4dDUH6yxn3GOBv4z5QDoMftm2dyCUpvdm
         /U9uPKxqDeUjZsRqdelkErjcO5KU75Ux3gKVrm50ISEEa/5qeEE6QQJUHB8ncpfDpDJY
         zZ9WE7UgVHohPGzSy/HCOSwnXR3qky1Nm2DSqcoFdY0X1jWLXiVmkqRU43G6kKOu11hP
         Kqig==
X-Gm-Message-State: APjAAAV3fOeCZj9U/A5oA6wevggoJ4hqh/ZzgGAhOreOa+kEC+wb/lI2
        3D+/T35jeZW7Ki+wtRJqHGKOUUhx
X-Google-Smtp-Source: APXvYqzGqpZQgkR0GVpjbilKXfSk0cxuxc92sd9DXO3QEbOkgclXcOqlmAIgeOzvOw+eK95fAnrkuQ==
X-Received: by 2002:aa7:cd52:: with SMTP id v18mr1732386edw.205.1578428118823;
        Tue, 07 Jan 2020 12:15:18 -0800 (PST)
Received: from kozik-book ([194.230.155.149])
        by smtp.googlemail.com with ESMTPSA id b13sm11469ejl.5.2020.01.07.12.15.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jan 2020 12:15:18 -0800 (PST)
Date:   Tue, 7 Jan 2020 21:15:15 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 09/20] memory: samsung: Rename Exynos to lowercase
Message-ID: <20200107201515.GE8636@kozik-book>
References: <20200104152107.11407-1-krzk@kernel.org>
 <20200104152107.11407-10-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200104152107.11407-10-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Jan 04, 2020 at 04:20:56PM +0100, Krzysztof Kozlowski wrote:
> Fix up inconsistent usage of upper and lowercase letters in "Exynos"
> name.
> 
> "EXYNOS" is not an abbreviation but a regular trademarked name.
> Therefore it should be written with lowercase letters starting with
> capital letter.
> 
> The lowercase "Exynos" name is promoted by its manufacturer Samsung
> Electronics Co., Ltd., in advertisement materials and on website.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/memory/samsung/Kconfig       | 2 +-
>  drivers/memory/samsung/exynos-srom.c | 2 +-

Applied.

Best regards,
Krzysztof

