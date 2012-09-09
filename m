From: Mike Dyer <mike.dyer@md-soft.co.uk>
Subject: MFC Encode on S5PV210 hangs
Date: Sun, 09 Sep 2012 20:21:54 +0100
Message-ID: <1347218514.1641.4.camel@edge.config>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi All,

I'm trying to use the MFC encoder to generate an H264 bitstream using
the V4L2 interface.  I've tried using my own application, and also the
example encode application here:
git://git.infradead.org/users/kmpark/public-apps

Both exhibit the same behavior.  Input frames are queued up until the
input queue is full, but only one frame is emitted (which I guess is the
H264 header).  The encoder then just sits there.

I'm not sure where to start looking, so any advice is appreciated.

Cheers,
Mike
