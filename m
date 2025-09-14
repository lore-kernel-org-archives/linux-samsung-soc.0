Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17690212574
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 15:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757862657; cv=none; b=o2kCtOiSiMnujIWK8VTSEWln1ydmGzgIaU4OT2tz/T87g2Rs8kq+57NQMIhjrpy++e0jyIOCmfeyxe3M7axdSHpCxHhHIRzCYtK/GxBEIN58WegPEGkO3dYBtcccJFbge5lTng8Goa/hKE/ktEqh1VIqn4rPABnTbKI3uXE+kLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757862657; c=relaxed/simple;
	bh=Kaf1vFQl07mrX87cDZrFLNzQLYHTzKo/KND7wsprVr0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=U5f81km59kBf2qX5D6jWv/hZ9HQ445Wqp4JTNhRbUiep6vjZfUk209X97HITyzaw1KaY+V9BLnSw9BfDqsPowNWwWYKupgI1eAffUyNoZ/4iX6XQjQam7gH1mC3NlQA+0UKKWiBdaMlfSLHLoXH6zaWphybiLpXW//SFlhHtx9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=L4WDnHCv; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="L4WDnHCv"
DKIM-Signature: a=rsa-sha256; b=L4WDnHCvWEfmG/9j1Vq7V3uSroHxRUgM8oYKb1PtlnZXCjsaiQXideBK2e9dAU+0AEUNENM3FqzGDtQDfcoxzdA1oZgj2N3AqWTG8wpmsllqW+Mw/7ZpcngrWpgP6smunf8WPIdaQNjBEzqijMnzHmRukUNhbKnl3zqYNt+SUfp0qmKxy9jlqkPMs0GqsrGHLIr/JGLjmwQZDc8F66xIsbfFKHb30v2cb9K0AUueJDlhToDoVUmMj+3RGN72vDY1L+IjU1zQmkb2+4RDHDiJSVcMD5x5c6CfJ+5na60WPE+GR5cOexGikJYdNvSn4x2v172SPRSymlt+dc9cl0tnGA==; s=purelymail3; d=purelymail.com; v=1; bh=Kaf1vFQl07mrX87cDZrFLNzQLYHTzKo/KND7wsprVr0=; h=Feedback-ID:Received:Date:Subject:From:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1079693920;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 14 Sep 2025 15:10:46 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 14 Sep 2025 17:10:44 +0200
Message-Id: <DCSMAUJKRPOU.3RGWV9GNN97ZX@mentallysanemainliners.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: regulator: document max77838 pmic
From: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>
To: "Ivaylo Ivanov" <ivo.ivanov.ivanov1@gmail.com>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Rob Herring" <robh@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250914130230.2622030-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914130230.2622030-2-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250914130230.2622030-2-ivo.ivanov.ivanov1@gmail.com>

On Sun Sep 14, 2025 at 3:02 PM CEST, Ivaylo Ivanov wrote:
> The max77838 is a pmic, containing a BUCK regulator and 4 LDOs. It's
> primarily used in the Samsung Galaxy S7 lineup and is accessed over I2C.
> Document it.
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---

Hi Ivaylo,

Reviewed-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>

Kind regards,
Igor
