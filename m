Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E112F83B5;
	Tue, 15 Sep 2026 06:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789455232; cv=none; b=f1LrWfuErUsPbcEdnf1j/+2kDzb3nPHHLRoo+1ld2/F1yeNxZYSWbXhMtiTZ7npTUDg+rV0CU92SgwEik9OsLW4va1IDaV9JHnmNePNQSgo31jqNFjXeHhyuGE9LGCFHfvYxMoXeMdqyoW76um5I6Or1dawUcmxONILR084TjrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789455232; c=relaxed/simple;
	bh=v4/qK/h4ZZ/YunWGTPg8FkPgQlyTl13jW7uuTg0YKF4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aHdCH8sdqh9j+MypjxDBDB66Gjc6ZKo8mevFpjkZuf8cjsWHXN9iQw3I5KbTvXgQQfPqLxqVw3sSK5P9fK5V7C+xjY4LHHdPsYewgid678p6GDK/REwyUfSdYPnTHWBOSuqg2z3wljmDZ7+w1hVn0ppJ5uuqSFkWAP9bpdgtxAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5MvIzGv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5MvIzGv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D0681F000FF;
	Tue, 15 Sep 2026 06:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789455231;
	bh=cUchE1Zh7ptn0AzvKmzY84GNBKfh/QkAkDlMN6pv/uc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=J5MvIzGv+Dci9Dofw9ky6uwD9+X0OI+FIS5OkosuOl9CYRKS4/YdyZlQ5I/i+BezT
	 loq9ybmRbtTcesAHwvc74xFl5ucQFN6HmJ5e2DdEVtksjpZ5scwaNysWWcz5uK9SjE
	 9D9tm11oIq38cxnN7uNYE99m4ltoI6TFAVar+0rJypbMNtNLrqXJJBYcvVFUZ+07P6
	 1W4/lsWp86wMdbAK77jvE+QAMXwJocOvZAW+q000bZ87OUQD2ezT3T8o3dAJ1AZaXM
	 PssUmWyuJLdA9Ntz+E60Ut79PtmxGVQ7B9NV7ieWemMC6qxnfxNV6YdJ/j+/e5OqbE
	 BsZczW2N/ozsw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260914-exynos850-mbox-dts-v2-1-798585c8f1ba@linaro.org>
References: <20260914-exynos850-mbox-dts-v2-1-798585c8f1ba@linaro.org>
Subject: Re: [PATCH RESEND v2] arm64: dts: exynos850: Add ap2apm mailbox
Message-Id: <178945522767.39169.14365156505199938615.b4-ty@b4>
Date: Tue, 15 Sep 2026 08:53:47 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Mon, 14 Sep 2026 17:32:45 +0100, Alexey Klimov wrote:
> Add mailbox node that describes AP-to-APM mailbox, that can be
> used for communicating with APM co-processor on Exynos850 SoCs.

Applied, thanks!

[1/1] arm64: dts: exynos850: Add ap2apm mailbox
      https://git.kernel.org/krzk/linux/c/61c04d2173896eb36f2bf55ce1804f7f8477d0e8

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

