From: Dron Gus <dron0gus@gmail.com>
Subject: Re: MFC V1.0 questions
Date: Tue, 6 Dec 2011 10:31:25 +0300
Message-ID: <CAA11ShBytXgQRr9rYbR-x1SyLGQuXrqc_wJTY0t1ou6gFmx+_w@mail.gmail.com>
References: <CAA11ShCGVGFr=hOF=CDCRtQZ0kG+y-ZB3ymYAYUFszKh1BaDqA@mail.gmail.com>
	<ADF13DA15EB3FE4FBA487CCC7BEFDF3622550078C5@bssrvexch01>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:47867 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753070Ab1LFHb1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Dec 2011 02:31:27 -0500
Received: by faar15 with SMTP id r15so1397683faa.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Dec 2011 23:31:26 -0800 (PST)
In-Reply-To: <ADF13DA15EB3FE4FBA487CCC7BEFDF3622550078C5@bssrvexch01>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kamil Debski <k.debski@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi.

On Mon, Dec 5, 2011 at 1:47 PM, Kamil Debski <k.debski@samsung.com> wrote:
> Hi,
>
>> From: linux-samsung-soc-owner@vger.kernel.org [mailto:linux-samsung-soc-
>> owner@vger.kernel.org] On Behalf Of Dron Gus
>> Sent: 02 December 2011 12:17
>>
>> Hello
>>
>> I am interested in a couple of questions related to mfv v1.0, used in
>> the s3c6410.
>> 1) Does anyone work on mfc v1.0 driver for mainline?
>
> There is no driver in the mainline. However you may find it in some repos
> on the web http://www.google.com/search?q=samsung+kernel+mfc10+driver
> that have an MFC 1.0 driver present.
Thank you. I saw this driver. But it does not use v4l2, so I think it
makes no sense to port it "as is".

>> 2) whether there is a newer firmware for MFC processor other than the V137?
>
> I have no idea. You may want to contact Samsung LSI in this matter
> http://www.samsung.com/global/business/semiconductor/footer/Footer_ContactUs.html
Ok. I'll try.

>> 3) how much different MFC version 1.0 (6410) and 4.0 (pv210). Should I
>> rely on the driver for MFC v4.0, when writing a driver for V1.0?
>
> These MFC version are very different. In addition there are many differences between
> version 4.0 and 5.0, although you can find some similarities between 4.0 and 5.0.
>
> For version 5.0 you can find the driver in mainline http://goo.gl/fbCKF.
>
> If you want to write the driver then you should consider using the V4L2 codec API.
All right. The above driver, I'll use as a reference on working with
hardware, driver for MFC v5.0 as a reference on working with V4L2 API.
