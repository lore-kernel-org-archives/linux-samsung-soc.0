Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287AB2DC786
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 15:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757863865; cv=none; b=GNgx5j9PomOWmcQVe7BzjCIt5DC/WjF/DfjfjflyQzqHQxXq7609+7PK736OMem7sqBkwCA8K6eB5yj0gQWv5VW/pZNsDiI9t/Xw0+AxL9Z+XH3P5xM1rshKRGcJYIwxXl65L5i/egZTn8+DzeJy3RDNA7agHl4QkFmiOKzX52w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757863865; c=relaxed/simple;
	bh=dTHczNh5onmLp5g+RNC4zwxe20ZSdQUfIQ2nnv/nAR8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=o6qKcycLqB4LU2wWOVR8MX++VjNe0iwpGSxgRQGC7Jnm/lp8c2OLk8K/KMZA0W0YOmAsarBH1a3K4+RHvIc6DxcqD8W4u8khR63N1KGGe0gij30Fz/vZsOymzYVwl9jfQCvBhbhseE+676/MjG2IqjcsBijYnropdodyW666760=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=sZ1mCNjc; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="sZ1mCNjc"
DKIM-Signature: a=rsa-sha256; b=sZ1mCNjcLb8O2Qs59Cgdi8XQmIr2zW8QpF5CXjJPHyYByVdvUfVvzRgrihuKmNY/gYoA2JmFMg8M2T0Gv6U1KFyAZ0s4dZndid+uGX9lC2dFypRRiVGVjYUD1q5TufnXjjR8VqDjBv7+pAEzmdDyPcAGLFDgfEv6l6VyP0XnaQXE72u/OQZtPky2wo2sgEiCdiJxiZawzx3cULzGA6tWhR+UpwjV9hiFnO7djPIvlqPohg7VuWhRn0jFcbHOuYciEkzTolCo4EZehlDWnNG/nGiSrTH9lfnKfo19qKNP7kVOZ2Ol5igXH9o3zt4qib2829ZjTFgJ0HHDgw8jMp6uvQ==; s=purelymail3; d=purelymail.com; v=1; bh=dTHczNh5onmLp5g+RNC4zwxe20ZSdQUfIQ2nnv/nAR8=; h=Feedback-ID:Received:Date:From:To:Subject;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1797260638;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 14 Sep 2025 15:30:46 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 14 Sep 2025 17:30:43 +0200
Message-Id: <DCSMQ58API63.34STG82T6E4N6@mentallysanemainliners.org>
From: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>
To: "Ivaylo Ivanov" <ivo.ivanov.ivanov1@gmail.com>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Sylwester Nawrocki" <s.nawrocki@samsung.com>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Rob Herring" <robh@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Tomasz Figa" <tomasz.figa@gmail.com>
Cc: <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 3/3] pinctrl: samsung: add exynos8890 SoC pinctrl
 configuration
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250914114457.2610013-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914114457.2610013-4-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250914114457.2610013-4-ivo.ivanov.ivanov1@gmail.com>

Hi Ivaylo,

On Sun Sep 14, 2025 at 1:44 PM CEST, Ivaylo Ivanov wrote:
> Add support for the pin-controller found on the exynos8890 SoC, used in
> Samsung Galaxy S7.
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---

Reviewed-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>

Kind regards,
Igor
