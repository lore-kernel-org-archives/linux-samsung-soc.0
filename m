From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH/RFC 0/5] HDMI driver for Samsung S5PV310 platform
Date: Tue, 08 Feb 2011 11:08:55 +0100
Message-ID: <002201cbc778$3483ffe0$9d8bffa0$%szyprowski@samsung.com>
References: <1297157427-14560-1-git-send-email-t.stanislaws@samsung.com>
 <201102081047.17840.hansverk@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <201102081047.17840.hansverk@cisco.com>
Content-language: pl
Sender: linux-media-owner@vger.kernel.org
To: 'Hans Verkuil' <hansverk@cisco.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>
Cc: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

On Tuesday, February 08, 2011 10:47 AM Hans Verkuil wrote:

> Just two quick notes. I'll try to do a full review this weekend.

Thanks! Please focus only on the "PATCH 4/5", which contains the driver itself.
The other patches are mostly platform prerequisites for the driver and will be
rewritten to fit better some extensions to Samsung platform API.

> On Tuesday, February 08, 2011 10:30:22 Tomasz Stanislawski wrote:
> > ==============
> >  Introduction
> > ==============
> >
> > The purpose of this RFC is to discuss the driver for a TV output interface
> > available in upcoming Samsung SoC. The HW is able to generate digital and
> > analog signals. Current version of the driver supports only digital output.
> >
> > Internally the driver uses videobuf2 framework, and CMA memory allocator.
> Not
> > all of them are merged by now, but I decided to post the sources to start
> > discussion driver's design.

> [snip]

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
