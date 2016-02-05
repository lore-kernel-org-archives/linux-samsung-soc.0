From: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>
Subject: Re: domain off
Date: Fri, 5 Feb 2016 10:13:32 +0900
Message-ID: <CAJKOXPeamBUZf7OrHfZe2qp1EbhU6+WL7GBwY5WvGZ_U+1N0Ag@mail.gmail.com>
References: <CAH9_wRPDMiCMNZJHkkK21oF8dySUfa5AUpGnp-nh6V77As6CPA@mail.gmail.com>
	<CAJKOXPe51YO3t1fhUdD1OsmXXcW3MoTwapvY4Y0q8QwaKrxzRg@mail.gmail.com>
	<CAH9_wRN13+PKLsTL3kSonLUpzHo7zbQJZ658C4+fRZRxe=HeTw@mail.gmail.com>
	<CAJKOXPeCyEYtUGf2skAbudOjGiSVn8Hyzk76B5aW8VJT7apoqA@mail.gmail.com>
	<CAH9_wRO28-4jMHwfVpwnDFbut6m=2gv_zVd3EnLguZj9EJYebA@mail.gmail.com>
	<569311BB.5040206@samsung.com>
	<CAH9_wRPnvosp4sq3fBHGhd7G=V69s7qQdg3mUF_d08aWS4H_ng@mail.gmail.com>
	<569F5D80.4040103@samsung.com>
	<CAH9_wRNxxifRBh6p77e3Pqh4QpbSmYrg6g+WOR2AjAX9EHG6ZA@mail.gmail.com>
	<CAJKOXPdWA67DjrymJZY9cnTRuzaUFmLWyC+iBA9wHBVmiD_mBQ@mail.gmail.com>
	<CAH9_wRPQoD4JT=VHPYjJE=V_7jjQyyfciUo-3k13s_wU=a_Qmg@mail.gmail.com>
	<CAJKOXPe52cxk4XCDt0HU2iv-Z_VJGB1TXuKd6uG-p-3mQW-v3w@mail.gmail.com>
	<CAH9_wRMqcDKkoEKUjcNwsN4xcWOx9wjFEqK+eyyBS-Xw8n6xZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:34800 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751373AbcBEBNd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Feb 2016 20:13:33 -0500
Received: by mail-oi0-f46.google.com with SMTP id w5so32273532oie.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Feb 2016 17:13:32 -0800 (PST)
In-Reply-To: <CAH9_wRMqcDKkoEKUjcNwsN4xcWOx9wjFEqK+eyyBS-Xw8n6xZQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sriram V <vshrirama@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org

2016-02-04 21:21 GMT+09:00 Sriram V <vshrirama@gmail.com>:
>
> Hi Krzystof,
>
> Thanks, right now we are seeing that the board hangs whenever the
> those domains are list of domains
> are modified by the cpuidle framework.
>
> Also, I have a related question, devfreq also updates the clocks as
> well depending on bus load conditions
>
> If a particular domains are OFF. Wont the devfreq update produce a
> crash. However, this does not happen.
> I do see lots of dout_aclk print which modifies the freq of clocks of
> different modules But that does not produce a crash.
>
> Am i missing something here?

This is not related to cpuidle. For Exynos usually the cpuidle enters
system sleep modes, so entire system is sleeping and devfreq does not
work in that moment.

However when power domains are off because of runtime PM, changing
clocks may be completely ok. Many clocks are not part of the power
domain itself. In the same time devfreq usually changes top level
clocks which is also quite safe.

Best regards,
Krzysztof
