Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D42165EF1;
	Fri, 27 Sep 2024 08:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727426918; cv=none; b=gYYeQKYRzP8cME6oXdWdRomzCuKleYK94OzeSu1717Ua/P2+eJnwEt74tltUT9j7fWtgp5lw6gtw7RwzJNbJwW+qZ+qif6RTn1bCRLOdyeDW5xUZLIeL1BYljj2QAIgShdfLChrkqI0hB861I0LUXwJPdcpuEdnCuxyyEplachk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727426918; c=relaxed/simple;
	bh=S3PzqNCMn+RvJMgwjff5MuTs/EAl6sQd0YGqak4qYHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tsvJU0YfWQwC5bThIFc8sr8Xn6ZNDlElg4rHSi9lX3nG8CwJfKXDoGeT/GRTRKt8Zy/KXJPEmUDQprhdcmLQYmmqjjYfKdIeLaJg6Fzi1YeK7nDfB2KT+eGzlAdksoRfIhcNT1EEl/qNK6MlS33XKShQof+nEe2NNMF9NRe3UEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4RppHUc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4RppHUc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEDBBC4CEC4;
	Fri, 27 Sep 2024 08:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727426917;
	bh=S3PzqNCMn+RvJMgwjff5MuTs/EAl6sQd0YGqak4qYHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L4RppHUcof1v4HwLvmUzmgtCu/suGi5bGGR/oWYSTmhiwzvYCDkepKMwQxgO7Zna8
	 fREb436TJHh6y8Fnqlfb48T53p1s7TDBqHeEr3y2wVqr39koHiSz7n8OelJR/Js9Xw
	 /PvuW8w92Y7KSRYODWLa2DR0VGq3Kd24EkWf4HK4N6/ABQ3zmVu+qrvaD9czTwqohB
	 PiXV8/nn5rt9esXz7DIZStShovNe1GYghvj6Kl5JjgMUOn1lkhpt16kPb/QDFDb86f
	 mX5XcYeUz87b1xXm2zsOdyB8ZICtHrNRIN5DPRuyEojBXx04Wr9OXPr2veA7fR5Hcr
	 exAtl86iJoHGA==
Date: Fri, 27 Sep 2024 10:48:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: mfd: add samsung,s2dos05
Message-ID: <ojtghglajoz5z2jeq75x5jhnjpkjtxothoxhluc7xkvdnrytjx@febct66fe752>
References: <20240617-starqltechn_integration_upstream-v5-0-ea1109029ba5@gmail.com>
 <20240617-starqltechn_integration_upstream-v5-1-ea1109029ba5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240617-starqltechn_integration_upstream-v5-1-ea1109029ba5@gmail.com>

On Thu, Sep 26, 2024 at 12:47:30PM +0300, Dzmitry Sankouski wrote:
> Add samsung,s2dos05 MFD module binding.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

