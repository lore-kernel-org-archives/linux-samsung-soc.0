Received: from mail-106103.protonmail.ch (mail-106103.protonmail.ch [79.135.106.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950AE45948
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Mar 2026 08:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772527923; cv=none; b=Z1kHq0nWN21kJGR/Op3SLPv9m+rQ0D9m3oGww4piB53ZrLI8eG31s+qO7OS8KDCRI16Msa3/2H0h2qsR90muT8yz4T7UKoIHT5bqLSfUQM4tW24pJC65U533iYekV3JkygmWKm/judm4yuNNfiE+izphIUGAN9eOupKK7YPz+i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772527923; c=relaxed/simple;
	bh=Fod3JbZQuIBkaNlNwCY/cC8qyNuyow7+P+pz3N5K9FY=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ANpajMAouikBaTEPZPwLJRA91zImxgFlHO0Jk5QFF0EorikB8gO6kQ4lzYwKwwnuONmjSIv2kdRp+hVTtNHsztWMWdTxH4lzMd0cUxs1151r23L+taMESHzKhNVJ0TmAwiNZHY+k/W949VuzMYXOZrK2MaCTqyXFD/kNBQaYM/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=YSs+oPiH; arc=none smtp.client-ip=79.135.106.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="YSs+oPiH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1772527914; x=1772787114;
	bh=Fod3JbZQuIBkaNlNwCY/cC8qyNuyow7+P+pz3N5K9FY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=YSs+oPiHD2mUtoPNqp2hN+A+HIMYN9bTicxY+GASFRK2OTcMHwPNU6b8gpu9WRydA
	 tGilv0LWttzdYwHzE6ZrGKmFYe8tB3/vukBvrFvP30me47Mjppzu4RzGqPR9DhzTFY
	 eyCfUKn23xg/Tt9NXZiEV1Te8RQGJoKQN7xqiCLNTvqiXbZo5+wKM+xgQ4/EKboHPc
	 wRYPMBz1HqG1OznsO3vRkLxhzrfTar5bAm/LtkqkKq21GHdT5k8jDraWCX0bsArosC
	 PDwwNqpUnAW1fIsXlgnIg4pg2vM9JdvXuzlb4u3UpO+2+iOfkh/nKwwoQVdAoj2NLh
	 V0zzfkwmOpFCQ==
Date: Tue, 03 Mar 2026 08:51:49 +0000
To: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: linux-samsung-soc
Message-ID: <f8fgGGqDayyygpJ9bKXp03S8lLW7grpjz-jRllxbZDH_mOc3ahil3hUdvW6bUyuMsVH0tlZfEAPYAHADv4zBq5_fSqdcLIvFERJLyCs1Y9k=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: 76e0dd508dd57810db61c8ee6409c96d90fffb73
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: linux-samsung-soc

Good day from Singapore,

Is this mailing list for Samsung Android phones discussion?

Thank you.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individuals Singapore
GIMP =3D Government-Induced Medical|Mental Problems|Poverty
3 March 2026 Tuesday 4.51 pm Singapore Time



