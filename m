Received: from mail-106104.protonmail.ch (mail-106104.protonmail.ch [79.135.106.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425E43DAAC4
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Aug 2026 09:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045688; cv=none; b=rRczFktnpzRPsDc2QHM145pJPaNgLZakOPwnDTAzN6w6Gq3hUe+fXx0h+WB5MyybTJGTMEacNcPIPAJreLM5bsWrwE8ls1QFTkaKJ8Q/r5WPAskyeMMlX+Ej4TggkvXP90xXoMshP967OT5UPO8fN6rAyKH2V03Z1e2yjffN1xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045688; c=relaxed/simple;
	bh=Q0a1d41jUyBzoUQnpBW1+sRJAnF6tWFUiwXSZlZsK3g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S6r9Mf4zRRdTyiuDNqeGczcq0z/glcCQJCLEp8tcM2He8n7Dut9KsHf2aUfz+73gbtVleQSj67tSfiUHelpbkDzdCP6USGvqQWLFZb6r+flWzc6F9s4/IDRdrsCLOKhXo9JqYZQzYNbTzP5jbmL5Pr3uXXtuuI0/5cnm3g8II1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=n5UXNllj; arc=none smtp.client-ip=79.135.106.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="n5UXNllj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1787045684; x=1787304884;
	bh=Q0a1d41jUyBzoUQnpBW1+sRJAnF6tWFUiwXSZlZsK3g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=n5UXNlljt/9mBHx5326t3Oh8YN+iuE2U1xAy5C+u5iHZxE+W0OXzWcR6Q+AmFCt5D
	 9CdHeVnO2Pk92mySDZ6LMQqE5hhbIOfDh2sZMI1150fXZ4hcrG8bmipUk2gkE5hGZf
	 EXcf6939gNE7z6IYuJCcRrZEiqKdg3Q42uq2xh3QnNSVDL7jXTmF5tBpQU/EkVXgn1
	 oUIFKytELQYGTntpxDtyVCA7GKIHqsxbLoO2PIn6/MftuEL4+NQkQT7nA9a9NDjsde
	 PK5gvLawfl12L8vkTXNZPGZ3fyFm9FeT89OYP1RfSGtlM/JjEWCb0qYtvw6L4FbrlI
	 GajOL59Dd5dvQ==
Date: Tue, 18 Aug 2026 09:34:40 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Aiden Isik <aidenisik@protonmail.com>
Cc: Aiden Isik <aidenisik@member.fsf.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Aiden Isik <aidenisik+git@member.fsf.org>
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: samsung-wdt: Add exynos5515-wdt compatible
Message-ID: <xYkqqAlkGO9BORDl0gr_RUf7wX_yGFV0umuQjGA6F4GEOpAhKqpe6AuwMy60a6DKPQoCwzD9BljivI8jwFvfvK2U2JCpkVSJ5nQU8pkblhs=@protonmail.com>
In-Reply-To: <20260818-singing-rhino-of-glamour-accb9e@quoll>
References: <20260817-for-next-lucky7-watchdog-v1-0-a14370e20b92@member.fsf.org> <20260817-for-next-lucky7-watchdog-v1-1-a14370e20b92@member.fsf.org> <20260818-singing-rhino-of-glamour-accb9e@quoll>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: 8afd6c597dbe49eae2ecfc00bae5b54add095e2a
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> DCO mismatch.

> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.

I did run checkpatch (promise) but then b4 failed to send with
that address so I changed it.
Will fix in v2 thanks.

> No need for the comment, old code is poor example here.

I'll remove it.

> samsung,cluster-index: false

> Just like other cases.

Will fix. Thanks for the review.

> Best regards,
> Krzysztof

Kind regards,
- Aiden Isik
