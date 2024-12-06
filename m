Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com [63.250.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD21F1FF7A1;
	Fri,  6 Dec 2024 11:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733485966; cv=none; b=iP0/PPq9F924l4WBzlEL60Jlhq+ZEjz/FlG9Bqf2i/xNX8xKdrjkIvA+6qKEJcZVsTwmbcxSS4Ds6wyLQLilv25MSkUXQtKHPkOTnfmWIHKdDqstcWv+8H96AdkepNsKq0hBnL8zjOEp0DTKdNuEQ2HlS4otuhQSLJd0Io+bbvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733485966; c=relaxed/simple;
	bh=lvB4BBNGMAV8YyKfA+yq4kRzeVqE1+GW4krTt9wxxCU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=MF0fvSdRcFSEllnSPujnGKyXpdflkXVuj+zAVVLpDvaNk02aBJQs6/ve+hb1+P7m6K8vHIJ0RnNHZJhhagzbnkd8UMg/E5INdkk9b+mXjZ5D06S/O8DZIZXspd5ixbz+J4FeuUGg6QXK6VipFp5Qg3vDDc2pEPAnkieqh03wz6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=OizvNwJR; arc=none smtp.client-ip=63.250.43.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="OizvNwJR"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y4V4W4w9FzGpPB;
	Fri, 06 Dec 2024 11:52:43 +0000 (UTC)
Received: from dummy.faircode.eu (public-gprs382651.centertel.pl [37.47.125.252])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y4V4M2Hlwz2x98;
	Fri,  6 Dec 2024 11:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733485958;
	bh=lvB4BBNGMAV8YyKfA+yq4kRzeVqE1+GW4krTt9wxxCU=;
	h=Date:From:To:Cc:In-Reply-To:Subject:From;
	b=OizvNwJRfvazQCJXHVxgSFiFTb+aJKnQwNqRSPzCgrB5QWoKmIxrgaPyPKYaeIMEv
	 5KC+acQ+Rt4nEW9dLGByzlklHhyrbyI58EMV+AGvWXJFdRJ6qETOM2Z8bhpNXP/bq/
	 cUy5mwUjZrmNhzHDIzB4c4cHabRRdjK1BHtoh3qw3LmwIW/rcWRWqrPhrrVZjpQuRs
	 5ICDTrgPnU8a1enY+Vf1CHhyOfrmd9rmCYCb6IeYpvPcN/QeDt+cndZzMtWTRvrflv
	 wk4cKNst5aqnWCL6XOvCPc/7mfe7dcjzRPVYGaRbq5c92PdDj4hp3AhgsOpVOD9N+k
	 dPC+p3KPZzo9A==
Date: Fri, 6 Dec 2024 12:52:29 +0100 (GMT+01:00)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: krzk@kernel.org
Cc: alim.akhtar@samsung.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, robh@kernel.org
Message-ID: <bb128c8f-5315-447f-ad47-c051a4a9ebf5@mentallysanemainliners.org>
In-Reply-To: <fdb4af16-468a-4c23-b8f4-ab60d4b535d2@kernel.org>
Subject: Re: [PATCH v1 1/1] arm64: dts: exynos990: Add clock management unit
 nodes
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <bb128c8f-5315-447f-ad47-c051a4a9ebf5@mentallysanemainliners.org>

Hi Krzysztof

Thanks for the review.

I just have a question - do you prefer having the two (pmu and cmu)
device tree changes spread out, or should I merge them into
one patchset?

Thanks and best regards

Igor
