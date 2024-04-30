Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A51C13D28D
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Apr 2024 14:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714487670; cv=none; b=kLDDZGOcni3q04lJx+mRLnmBfDC8q6bXrGYjEOf86BqdcNDYkYg7yQ+/c/KcKpeN2SUVOs1INQg5kz/b6JY/TFd47jdO2Uo3H/bE7JEFU0rTHVz1RenVD9a9TRom2Lp06q78gxSk8Cj3qyy4YQ9Yw4nSAMqDDttKQxVg6SVrVDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714487670; c=relaxed/simple;
	bh=BowcQTTTMJjPpWbQ5B79VlgoGv5qCa7h6ih1CkrUAUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lDsEHXX0v5R888oJ1eHr/I0LX4vJw9WU5hTirPZvsyXrRVuQ0PKIVvHhk9atre3FgmVBGFie8W9VDD9jAs9fRp8wGVa0WfNY67w4w0oycXwC+pxZ5dCfj7JbzG/FhJUjmRRls6ljLlaItcL9m2yK7bcywxpsQ6sKJvPigLQ7yVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=GaikiQR8; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="GaikiQR8"
Date: Tue, 30 Apr 2024 16:34:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1714487663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9kgf32OCLlwA5McXJsg0Plcc3wzDRgtsZZH1EUU3NCI=;
	b=GaikiQR8EuOiTcUpwvowkumgyXXAoQMd7mX8C1wZUL5cNZ9CoY0C3K7gj9r9wv/TyDeGhv
	EAD4wLaXz1IyXHHTFq7D9Gqd+e9HT7L70S1a4K4n9q0d4Q1rlphbAWgWHi83r9ANWZ6nit
	RUqDB2UzlLhyp8ZTdF6CbpZybv1TpdA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Henrik Grimler <henrik@grimler.se>
To: andre.draszik@linaro.org, peter.griffin@linaro.org
Cc: krzk@linaro.org, semen.protsenko@linaro.org,
	linux-samsung-soc@vger.kernel.org
Subject: gs101 vendor kernel sources
Message-ID: <20240430143208.GA7157@samsung-a5>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi André and Peter,

I am working on getting mainline linux to work on a phone with an
Exynos 8895 SoC.  Samsung has not released any user manual for this
SoC, so I only have the vendor kernel sources as reference.

Exynos 8895 seem to have some similarities with gs101 and Exynos 850,
so it has been very helpful to follow your work on gs101, and Sam's
work on e850-96.  For e850-96 it is extra helpful that the vendor
kernel [1] is available, which is very similar to vendor kernel for my
Exynos 8895 phone.

Is there a similar vendor kernel available for gs101 that you have the
possibility to share?

[1] https://gitlab.com/Linaro/96boards/e850-96/kernel/-/tree/last_samsung_commit

Best regards,
Henrik Grimler
