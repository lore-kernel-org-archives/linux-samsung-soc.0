Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794016;
	b=xwpxtyhqVT/DHql9pVdWlijFi4n+UPxdtUwXczbjT7QtAKaWJhiLRCdy1B3rWJ/fJeGT
	 cAvBwsM4XPf4QZ0Z0WPkBnbrBxNZ5vobKuRGP4Gi8pX/BKbmCIxVDwY5PUFl5pJucsSu4
	 kG9Eon+8xLt3Kwjq0Ff9gYtnUSXRzjR2b4O4iOYS004qEFc3IpEu732dYth+881F72A+8
	 V6/YYFsVQJJAT5pQVs6fTDobFxYQxt8J8DpeWppxxylZqaoDab32ii4jBKoE6ZCoPfsIp
	 h51w+tIK48qbIvNay3CooE2QlqfqUy7B7AeaHZJznigQNfDB5MXuiTh7i1WiiExDQ8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794016;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=tKebX395MPBUtnrs1wapuNSuu9yDp888WscSsnZmE3g=;
	b=TC5L7HZJ7U4WO8DWVZFMpeYuGk17SfADv81WVCVNt5IAzAvKQy3fVoOx6QsFLkGWhN0R
	 ewn3uOdsAme8FhNA2FglGz72RIFehTajqugh/UPwiST8kJzxzhB0AsDqcUbC7OSP8AnGo
	 HoINatFHVDT3q2XKAehTWWUo5eFvGmOwVu11VrGe+fpkPuM+DaeWj9/3nidsPp5xv5tdN
	 GA4TX/VXjpd1s/hWqMJ5JChfBr/axWRzZ179pUXqBBHuTzftUY2D0KC5qP0GtSF3GWwqi
	 BkaIPL7lMW0nbHhh0IV45zkAZvLgQToy3e7equEFz2+pzeDmbf+WlC4KSqeh1w6utQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EQXvaxss;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF60606A31E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Nov 2026 15:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EQXvaxss
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E4531F000C1;
	Fri, 27 Nov 2026 15:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795794016;
	bh=tKebX395MPBUtnrs1wapuNSuu9yDp888WscSsnZmE3g=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=EQXvaxss2fZNA1aQjVWEty4gmAnbcXCQ7LXMsZavdxc6MN9KYGeuMME4Qmy0DdZLd
	 wNAVt/GIZGAr9YF2QwZrnF7ZFpMOWpz05nBZTWrfors/BpujWyWR2Aq5MDqJJmwSsc
	 xi8cnWTVsDUQU6LCIZfiQBhrk/8LTVd8fNx7Kb/nx/xkjuUe+pGQIQOlElu2Lf527b
	 eNcOty4GHLATfuDWsAutQLp1fNi6TfipRa2csjbnh0lu4xzSfEWccg/ueW1nssGusK
	 +OAvLXmA8urNGq+A3zJG4ooR2fjKJm19tgPOy0RZ76cSVWDhfatuTHVn35wW516hJG
	 VEh0dmk+onNhg==
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] phy: samsung: exynos5250-sata: fix unreliable PLL lock
 timeout
From: Manivannan Sadhasivam <mani@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-phy@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
In-Reply-To: <20261118191233.376139-1-m.szyprowski@samsung.com>
References: <CGME20261118191239eucas1p1054471efd4b07967555d34a2aed994c0@eucas1p1.samsung.com>
 <20261118191233.376139-1-m.szyprowski@samsung.com>
Date: Fri, 27 Nov 2026 21:10:09 +0530
Message-Id: <179579400918.13164.7642589711897506797.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1415; i=mani@kernel.org;
 h=from:subject:message-id; bh=4fnP70Hwi6oxs/49NcriEAR5sL3O4G7nAt6m7i5s4ks=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCaRc320Fk4ATr3mRxwdqMXXQpeQlGisBquRvW
 NqIHyk/pS+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawmkXAAKCRBVnxHm/pHO
 9bo/B/905D9IsfVrMtj+WvHvnGRygHeovcwNzp/hX/QSguBA8GcSRjj7J7HEEaw6rTzgc4RncDt
 at+GWy80EImliinHzJwMpR3sWdlWbxMOex9N5PfosSNnk9a+4ZlA7794ofY7hkaY/l44fWYfkhy
 6q5SBL2e1zyXW9xuA368XVXvi9qK8eMNXIr42U3hisSsVNug0hWQ+3YWU4LKxNdQdXGlDqFx/K8
 g1JFHr5wMQqughQWivLitCRdsrZXPWThWCoHuhCYy+zUDqJoSoAKQIa7qMQ+H7NelCOv4Bs3KS6
 A+uMeeiYj6P2EAPrpKntNxWV5NHHx+ElNahxHO5C46Gq6EKx
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-18 20:12 +0100, Marek Szyprowski wrote:
> On Arndale boards the SATA PHY occasionally fails to initialize, which
> makes the AHCI controller probe fail and the attached disk disappear:
> 
>   phy phy-12170000.sata-phy.11: PHY PLL locking failed
>   phy phy-12170000.sata-phy.11: phy init failed --> -14
>   ahci-dwc 122f0000.sata: probe with driver ahci-dwc failed with error -14
> 
> The PLL lock is polled by wait_for_reg_status() with a timeout of
> usecs_to_jiffies(1000). On ARM with the default HZ=100 that rounds up to
> a single jiffy, so the effective timeout is anything between almost zero
> and 10ms, depending on where in the tick period the wait starts. The
> loop also does not re-check the status after the deadline has passed,
> so an interrupt or preemption during polling can turn an already locked
> PLL into a reported failure. Finally, -EFAULT is a misleading error code
> for a timeout.
> 
> Replace the open-coded loop with readl_poll_timeout(), which measures
> time with ktime, performs a final read after the timeout, and returns
> -ETIMEDOUT. Use a 10ms timeout, matching the upper bound of the
> previous behaviour with HZ=100.
> 
> Fixes: bcff4cba41bc ("PHY: Exynos: Add Exynos5250 SATA PHY driver")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


