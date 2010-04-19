From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH/RFC v1 0/3] [ARM] Add Samsung S5P camera interface driver
Date: Mon, 19 Apr 2010 12:29:57 +0200
Message-ID: <1271673000-3020-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: p.osciak@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hello

The following  patch series is a camera interface driver for the Samsung S5PC100 and S5PV210 SoCs.
The camera interface in these chips can operate in three modes:
- ITU-R or MIPI camera capture mode
- Memory to memory mode enabling color format conversion, scaling, flipping and rotation,
- LCD FIFO mode where it can be configured to transfer image data from memory to LCD controller, 
  through its direct FIFO channel to LCD controller; this allows to lower main data bus 
  bandwidth and memory requirements.

There is no designated memory for FIMC device (it shares the system memory) and it requires 
physically contiguous buffers.
We are planning  to use separate video nodes, each supporting one of the aforementioned features.

The following patches implement memory to memory mode and require the memory to memory device framework
posted by Pawel Osciak. Also in some use cases like video stream encoding, where FIMC acts as video 
postprocessor, non contiguous multi-planar buffers, as discussed in this thread
http://www.mail-archive.com/linux-media@vger.kernel.org/msg15850.html
would be needed. To simplify things a bit, I did not add a code related to non contiguous multi-planar 
formats in the following patches. 

Any comments and suggestions are really appreciated.

This series contains:

[PATCH v1 1/3] ARM: S5P: Add FIMC driver platform helpers
[PATCH v1 2/3] ARM: S5PC100: Add FIMC driver platform helpers
[PATCH v1 3/3] ARM: S5P: Add Camera interface (video postprocessor) driver


Regards,
--
Sylwester Nawrocki
SPRC,
Linux Platform Group
