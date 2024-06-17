Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B3919885D;
	Mon, 17 Jun 2024 22:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718663088; cv=none; b=Q0InjnB0ocLpgLHjsz6lv3G5Itky1xyNiEZ1xZHOiUY8KSFWXRSvospDkb1vILFBIKhqOByeh4rWLOI5DQU+NwJ+ur5iTBdV9mWoYeNA4HYHwREPzHvyJ+LHn4Dorq9H6Z7Mwv7zbaJ5fdUC6hBiQoxAE4d7TC9MJxrHIS+xDII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718663088; c=relaxed/simple;
	bh=dxYZ3rto3urXZxH/ox23h1g+ipYLkUqCdFX07jBAauU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BYJakSp/vgQdGyGMEHFLX28ph9AjQ59YpzRm+Cg8QF557/aWKqk2FTBP4z6oAIEgIPcg5fo3FW4KxTwuR07lsszpnYBACkr15jPmXeCicTbXDM0swJ0Mr8bUfSpRbY4mTdqoIXii2nz4lg9/US0fL2YVtttsnNgKFO0Lyp0HBEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=KRMZuhUa; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="KRMZuhUa"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AFAC145E2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1718663085; bh=6TWn/l9pktBcbkbB492KVy81g2F+cmsxbVam3E418SA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KRMZuhUaeiCZzdqINKn5jcDyn3JaUqRc7NcM+/nll5LWRBRmP6u9WqGYItKrPQKIn
	 4asJDAIhGc6tfUAaFXQMJLa+DUyU4GVcx8UE4gI9hwqGe5nStPWnUbagn7Z1yoN9ia
	 slAc1Hn0Bn8LbIIa4vWlpsx5rFeOqpu3IKwSLOhJeAjV7XQD7mXd1EVRGlJa6xDyC8
	 3VwLXDsxclFBktvdWX8opPPF2pSVDKUE4SFSsTxN+YNTR1TY+BoupYCbzCp6cJ6Q3m
	 Sp/w89C+jiMsA2EXbz3jwqnkjKStPBus1E4qcqKle3l8FiW99eYMfB8hXyOPG/33T1
	 zTTh3E2kXRWSw==
Received: from localhost (c-24-9-249-71.hsd1.co.comcast.net [24.9.249.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id AFAC145E2A;
	Mon, 17 Jun 2024 22:24:45 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thomas Huth <thuth@redhat.com>, linux-doc@vger.kernel.org, Krzysztof
 Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 arnd@arndb.de
Subject: Re: [PATCH] Documentation: Remove unused "mtdset=" from
 kernel-parameters.txt
In-Reply-To: <20240614182508.600113-1-thuth@redhat.com>
References: <20240614182508.600113-1-thuth@redhat.com>
Date: Mon, 17 Jun 2024 16:24:44 -0600
Message-ID: <87tthrgqc3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Huth <thuth@redhat.com> writes:

> The kernel parameter "mtdset" has been removed two years ago in
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support") and
> thus should be removed from the documentation now, too.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 87d5bee924fe..ff02e1a02e12 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3631,11 +3631,6 @@
>  	mtdparts=	[MTD]
>  			See drivers/mtd/parsers/cmdlinepart.c
>  
> -	mtdset=		[ARM]
> -			ARM/S3C2412 JIVE boot control
> -
> -			See arch/arm/mach-s3c/mach-jive.c

Applied, thanks.

jon
